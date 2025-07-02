package com.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.reactive.function.client.WebClient;

import com.bean.SearchLogBean;
import com.dao.SearchLogDao;
import com.util.ViewPaths;

@Controller
public class AdminController {

	@Autowired
	SearchLogDao searchLogDao;
	
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
	@ResponseBody
	public String fetchData(@RequestParam String prompt) {
	    Map<String, Object> body = Map.of(
	        "model", "deepseek/deepseek-r1:free",
	        "messages", List.of(
	            Map.of("role", "user", "content", prompt)
	        ),
	        "max_tokens", 512,
	        "temperature", 0.7
	    );

	    return openRouterClient.post()
	        .uri("/api/v1/chat/completions")
	        .bodyValue(body)
	        .retrieve()
	        .bodyToMono(String.class)
	        .block();
	}
}
