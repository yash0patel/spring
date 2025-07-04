package com.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.util.ViewPaths;

@Controller
public class PaymentController {
	@GetMapping("paynow")
	public String payNow() {
		return ViewPaths.PAYNOW;
	}
}
