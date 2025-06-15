package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.CalculatorBean;
import com.bean.EmpBean;
import com.bean.UserBean;

@Controller
public class sessionservlet {
	
	@GetMapping("signup")
	public String signup() {
		return "SignUp";
	}
	
	@GetMapping("home")
	public String home() {
		return "Home";
	}
    
	@GetMapping("login")
	public String login(String email,String password) {
		System.out.println(email);
		System.out.println(password);
		return "Login";
	}
	
	@PostMapping("loginuser")
	public String loginuser(String email,String password) {
		System.out.println(email);
		System.out.println(password);
		return "Home";
	}
	
	@PostMapping("saveuser")
	public String saveuser(UserBean userBean)
	{
		System.out.println(userBean.getFirstName());
		System.out.println(userBean.getLastName());
		System.out.println(userBean.getEmail());
		System.out.println(userBean.getPassword());
		System.out.println(userBean.getGender());
		
		return "Home";
	}
	
	@GetMapping("calc")
	public String calc() {
		return "Calc";
	}
	
	@PostMapping("calculate")
	public String calculate(CalculatorBean calculatorBean)
	{
		System.out.println("sum = "+(calculatorBean.getN1()+calculatorBean.getN2()));
		return "Calculate";
	}
	
	@GetMapping("empform")
	public String empsalary() {
		return "EmpSalary";
	}
	
	@PostMapping("saveemployee")
	public String calculateSalary(EmpBean empBean)
	{
		if(empBean.getSalary() > 1200000)
		{
			System.out.println("You are taxable.");
		}
		else
		{
			System.out.println("You need to earn more");
		}
		return "Home";
	}
}
