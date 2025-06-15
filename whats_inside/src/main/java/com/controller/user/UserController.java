package com.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dao.UserDao;

@Controller("userrole")
public class UserController {

	@Autowired
	UserDao userDao;
	
	@GetMapping("home")
	public String home(Model model)
	{
		return "Home";
	}
}
