package com.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dao.UserDao;

@Controller
public class UserController {

	@Autowired
	UserDao userDao;
	
	@GetMapping("listusers")
	public String listuser(Model model)
	{
		model.addAttribute("userList",userDao.getAllUsers());
		return "ListUser";
	}
}
