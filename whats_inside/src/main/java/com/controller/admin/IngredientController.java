package com.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.IngredientBean;
import com.dao.IngredientDao;

@Controller
public class IngredientController {

	@Autowired
	IngredientDao ingredientDao;
//	@Autowired
//	IngredientBean ingredientBean;
	
	@GetMapping("newingredient")
	public String newIngredient()
	{
		return "NewIngredient";
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
		return "ListIngredients";
	}
	
	@GetMapping("viewingredient")
	public String viewIngredient(Integer id,Model model)
	{
		Long nextId = ingredientDao.getNextId(id);
		 model.addAttribute("nextId", nextId);
		model.addAttribute("ingredient",ingredientDao.getIngredientById(id));
		return "ViewIngredient";
	}
	
	@GetMapping("search")
	public String searchingred(Model model)
	{
		return "searchingredient";
	}
	
	@PostMapping("search")
	public String searchingredindb(String name,Model model)
	{
		List<IngredientBean> list = ingredientDao.searchIngredientByName(name);
	    if (list.isEmpty()) {
	       model.addAttribute("msg", "No ingredients found.");
	       ingredientDao.logEmptySearch(name);
    	}
		   
		model.addAttribute("list", list);
		return "searchingredient";
	}
}
