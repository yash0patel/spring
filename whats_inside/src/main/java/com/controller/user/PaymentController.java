package com.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.PaymentBean;
import com.bean.UserBean;
import com.service.PaymentService;
import com.util.ViewPaths;

import jakarta.servlet.http.HttpSession;

@Controller
public class PaymentController {
	
	@Autowired
	PaymentService paymentService;
	
	@GetMapping("paynow")
	public String payNow(HttpSession session, Model model) {
		UserBean user = (UserBean) session.getAttribute("user");

	    if (user != null && user.getEmail() != null) {
	        model.addAttribute("email", user.getEmail());
	    }
		return ViewPaths.PAYNOW;
	}
	
	@PostMapping("processPayment")
	public String processPayment(PaymentBean paymentBean) {
		System.out.println(paymentBean.getCardNumber());
		System.out.println(paymentBean.getCvv());
		System.out.println(paymentBean.getExpDate());
		System.out.println(paymentBean.getEmail());

		paymentService.chargeCreditCardn(500D,paymentBean);
		return ViewPaths.USER_DASHBOARD;
	}
}
