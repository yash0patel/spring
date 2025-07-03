package com.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.IngredientBean;
import com.bean.SearchLogBean;
import com.dao.IngredientDao;
import com.dao.SearchLogDao;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.util.ViewPaths;

@Controller
public class AdminController {

	@Autowired
	SearchLogDao searchLogDao;
	
	@Autowired
	IngredientDao ingredientDao;
	
//	@Autowired
//    private WebClient huggingFaceClient;
	
	@Autowired
	private WebClient openRouterClient;
	
	@GetMapping("admindashboard")
	public String adminDashboard() {
		return ViewPaths.ADMIN_DASHBOARD;
	}

	@GetMapping("searchlog")
	public String searchLog(Model model) {
		List<SearchLogBean> list = searchLogDao.getAllLogs();
		model.addAttribute("list", list);
		return ViewPaths.ADMIN_SEARCH_LOG_LIST;
	}
	
	@GetMapping("deletesearchlog")
	public String deleteSearchLog(Integer id)
	{
		searchLogDao.deleteSearchLogById(id);
		return "redirect:/searchlog";
	}
	
	@GetMapping("fetchdata")
	public String fetchData(String name,RedirectAttributes redirectAttributes) {
		System.out.println(name);
		String prompt = "Return ONLY a valid JSON object for the ingredient " + name +
			    ", which may be an INS number (e.g., INS 211), common name (e.g., MSG), or scientific name (e.g., Monosodium Glutamate). " +
			    "Try to match even if the input is slightly misspelled. " +
			    "If no match exists, return only: false (no quotes, no formatting). " +
			    "If matched, return JSON with keys: name, scientificName, commonUsage, avoidBy, fda, fssai, efsa. " +
			    "'name' must be the INS code (e.g., 'INS 211'), and 'scientificName' the full compound name, optionally with the common name in brackets " +
			    "(e.g., 'L-Aspartyl-L-phenylalanine methyl ester (Aspartame)'). " +
			    "'avoidBy' should be a comma-separated list of sensitive groups (e.g., Children, Pregnant Women, People with Allergies, etc.). " +
			    "No explanation, markdown, or extra text.";

	    Map<String, Object> body = Map.of(
	        "model", "deepseek/deepseek-r1:free",
	        "messages", List.of(
	            Map.of("role", "user", "content", prompt)
	        ),
	        "max_tokens", 800,
	        "temperature", 0.5
	    );

	    try {
	        String response = openRouterClient.post()
	            .uri("/api/v1/chat/completions")
	            .bodyValue(body)
	            .retrieve()
	            .bodyToMono(String.class)
	            .block();

	        ObjectMapper mapper = new ObjectMapper();
	        JsonNode root = mapper.readTree(response);
	        String rawContent = root.path("choices").get(0).path("message").path("content").asText();

	        if (rawContent == null || rawContent.isBlank()) {
	        	redirectAttributes.addFlashAttribute("error","Error: AI returned empty content.");
	            return "redirect:/searchlog";
	        }

	        // Clean code blocks
	        String cleanedContent = rawContent
	            .replaceAll("(?i)```json", "")
	            .replaceAll("(?i)```", "")
	            .trim();

	        System.out.println("🧪 Cleaned JSON:\n" + cleanedContent);
	        if (cleanedContent.equalsIgnoreCase("false")) {
	        	redirectAttributes.addFlashAttribute("error","No such ingredient found. Please check the name.");
	            return "redirect:/searchlog";
	        }
	        
	        IngredientBean ingredientBean;
	        try {
	        	ingredientBean = mapper.readValue(cleanedContent, IngredientBean.class);
	        } catch (Exception jsonEx) {
	        	redirectAttributes.addFlashAttribute("error","JSON parsing failed. Invalid or incomplete AI output.");
	            return "redirect:/searchlog";
	        }

	        ingredientDao.addIngredient(ingredientBean);
	        searchLogDao.deleteLogsBySearchTerm(name);

	        redirectAttributes.addFlashAttribute("successMsg","Ingredient fetched for input '" + name + "' and saved as: " + ingredientBean.getName());
            return "redirect:/searchlog";

	    } catch (Exception e) {
	    	redirectAttributes.addFlashAttribute("error","Server error: " + e.getMessage());
            return "redirect:/searchlog";
	    }
	}
}
