package com.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SessionController {

	@PostMapping("/signup")
	public String signup() {
		return "Signup done";
	}
}
