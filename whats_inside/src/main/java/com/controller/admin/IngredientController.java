package com.controller.admin;

import com.util.ViewPaths;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.IngredientBean;
import com.dao.IngredientDao;
import com.dao.SearchLogDao;

@Controller
public class IngredientController {

	@Autowired
	IngredientDao ingredientDao;
	@Autowired
	SearchLogDao searchLogDao;
	
	@GetMapping("newingredient")
	public String newIngredient()
	{
		return ViewPaths.ADMIN_NEW_INGREDIENT;
	}
	
	@PostMapping("saveingredient")
	public String saveIngredient(IngredientBean ingredientBean)
	{
		ingredientDao.addIngredient(ingredientBean);
		return "redirect:/listingredients";
	}
	
	@GetMapping("listingredients")
	public String listIngredients(Model model)
	{
		model.addAttribute("list", ingredientDao.listIngredients());
		return ViewPaths.LIST_INGREDIENTS;
	}
	
	@GetMapping("viewingredient")
	public String viewIngredient(Integer id, String search_term, Model model)
	{
		 if (search_term == null || search_term == "") {
			 Long nextId = null;
			 nextId = ingredientDao.getNextId(id);			
			 
			 model.addAttribute("nextId", nextId);
		 }
		 else {
			 model.addAttribute("search_term", search_term);
		 }
		model.addAttribute("ingredient",ingredientDao.getIngredientById(id));		        
		return ViewPaths.VIEW_INGREDIENT;
	}
	
	@GetMapping("search")
	public String searchingred(Model model)
	{
		return ViewPaths.SEARCH_INGREDIENT;
	}
	
	@PostMapping("search")
	public String searchingredindb(String name,Model model)
	{
		List<IngredientBean> list = ingredientDao.searchIngredientByName(name);
	    if (list.isEmpty()) {
	       model.addAttribute("msg", "No ingredients found.");
	       searchLogDao.logEmptySearch(name);
    	}
	    model.addAttribute("search_term", name);  
		model.addAttribute("list", list);
		return ViewPaths.SEARCH_INGREDIENT;
	}
	
	@GetMapping("deleteingredient")
	public String deleteIngredient(Integer id)
	{
		ingredientDao.deleteIngredientById(id);
		return "redirect:/listingredients";
	}
	
	@GetMapping("updateingredient")
	public String updateIngredient(Integer id, String search_term, Model model)
	{
		model.addAttribute("ingredient", ingredientDao.getIngredientById(id));
		model.addAttribute("search_term", search_term);
		return ViewPaths.ADMIN_UPDATE_INGREDIENT;
	}
	
	@PostMapping("updateingredient")
	public String saveUpdate(IngredientBean ingredientBean,String search_term) {
	    ingredientDao.updateIngredient(ingredientBean);

	    if (search_term == null || search_term.trim().isEmpty()) {
	        return "redirect:/viewingredient?id=" + ingredientBean.getIngredientId();
	    }

	    return "redirect:/viewingredient?id=" + ingredientBean.getIngredientId() + "&search_term=" + search_term;
	}

}
