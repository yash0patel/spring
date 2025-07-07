package com.controller.user;

import com.util.ViewPaths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dao.IngredientDao;
import com.dao.UserDao;

@Controller("userrole")
public class UserController {

	@Autowired
	UserDao userDao;
	@Autowired
	IngredientDao ingredientDao;
	
	@GetMapping("home")
	public String home(Model model)
	{
		return ViewPaths.HOME;
	}
	
	@GetMapping("userdashboard")
	public String userDashboard(Model model)
	{
		model.addAttribute("list", ingredientDao.listIngredients());
		return ViewPaths.USER_DASHBOARD;
	}
	
}
