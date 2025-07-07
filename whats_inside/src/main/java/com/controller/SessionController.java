package com.controller;
import com.service.SmsService;
import com.util.ViewPaths;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
//import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.UserBean;
import com.dao.UserDao;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class SessionController {

    private final SmsService smsService;

	@Autowired
	JavaMailSender mailSender;
	@Autowired
	UserDao userDao;
	@Autowired
	PasswordEncoder passwordEncoder;


    SessionController(SmsService smsService) {
        this.smsService = smsService;
    }
	
	
	@GetMapping("signup")
	public String signup() {
		return ViewPaths.SIGNUP;
	}

	@GetMapping(value = { "login", "/" })
	public String login() {
		return ViewPaths.LOGIN;
	}

	@PostMapping("saveuser")
	public String saveUser(@Validated UserBean user, BindingResult result, Model model,HttpSession session,HttpServletRequest request) {
		if (result.hasErrors()) {
			model.addAttribute("result", result);
			return ViewPaths.SIGNUP;
		} else {
			user.setPassword(passwordEncoder.encode(user.getPassword()));
			userDao.adduser(user);
//			SimpleMailMessage message = new SimpleMailMessage();
//	        message.setFrom("yashpatelrupal@gmail.com");
//	        message.setTo(user.getEmail());
//	        message.setSubject("Welcome to What's inside!!!");
//	        message.setText("Welcome to What's inside!!! we are happy to help you.");
//			mailSender.send(message);

			try {
				// Load HTML template from resources
				Resource resource = new ClassPathResource("templates/welcome-mail-temp.html");
				String htmlContent = new String(Files.readAllBytes(resource.getFile().toPath()));
				
				// Prepare the email
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true);

				helper.setFrom("yashpatel573a@gmail.com");
				helper.setTo(user.getEmail());
				helper.setSubject("Welcome to What's inside!!!");
				helper.setText(htmlContent, true); // true means HTML

				// Send the email
				mailSender.send(message);
			} catch (Exception e) {
				e.printStackTrace(); // handle error properly in production
			}
			try {
				smsService.sendWelcomeSms(user.getMobileNo());					
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			session.invalidate();
			

			HttpSession newSession = request.getSession(true);
			user.setPassword(null);
	        newSession.setAttribute("user", user);

	        return "redirect:/home";
		}
	}

	@PostMapping("/login")
	public String authenticate(String email,String password,Model model,HttpServletRequest request) {

	    boolean isAuthenticated = userDao.authenticate(email, password);

	    if (!isAuthenticated) {
	        model.addAttribute("error", "Invalid login details");
	        return ViewPaths.LOGIN;
	    }

	    UserBean user = userDao.getUserByEmail(email);
	    String role = user.getRole();

	    HttpSession session = request.getSession(true);
	    user.setPassword(null);
	    session.setAttribute("user", user);
	    session.setAttribute("role", role);
	    
	    if ("users".equalsIgnoreCase(role)) {
	        return "redirect:/userdashboard";
	    } else if ("admin".equalsIgnoreCase(role)) {
	        return "redirect:/admindashboard";
	    }
	    return "redirect:/home";
	}


	@GetMapping("forgotpassword")
	public String forgotPassword() {
		return ViewPaths.FORGOT_PASSWORD;
	}

	@PostMapping("forgotpassword")
	public String sendOTP(String email, Model model) {
		if (email == null || !userDao.isEmailRegistered(email)) {
			model.addAttribute("error", "Insert a correct or valid email");
			return ViewPaths.FORGOT_PASSWORD;
		}
		try {
			// Load HTML template from resources
			Resource resource = new ClassPathResource("templates/sendOtpEmail.html");
			String htmlContent = new String(Files.readAllBytes(resource.getFile().toPath()));

			// Prepare the email
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);

			String otp = userDao.generateOtp();
			if (!userDao.setOtp(email, otp)) {
				model.addAttribute("error", "Server error, please try again");
				return ViewPaths.FORGOT_PASSWORD;
			}

			htmlContent = htmlContent.replace("${otp}", otp);
			helper.setFrom("yashpatel573a@gmail.com");
			helper.setTo(email);
			helper.setSubject("Your OTP Code");
			helper.setText(htmlContent, true); // true means HTML

			// Send the email
			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace(); // handle error properly in production
		}

		model.addAttribute("email", email);

		return ViewPaths.OTP_FORM;
	}

	@PostMapping("verifyOtp")
	public String verifyOtp(String email, String otp, String newPassword, Model model) {
		if (userDao.verifyOtp(email, otp)) {
			model.addAttribute("msg", "OTP verified successfully!");
			model.addAttribute("isVerified", true);

			if (newPassword.length() == 0 || newPassword == null) {
				model.addAttribute("msg", "Enter Valide password!");
				model.addAttribute("email", email);
				model.addAttribute("otp", otp);
				return ViewPaths.OTP_FORM;
			}

			if (!userDao.changeUserPassword(email, newPassword)) {
				model.addAttribute("error", "Failed to update password. Please try again later.");
			}

			model.addAttribute("email", email);
			return ViewPaths.LOGIN;
		} else {
			model.addAttribute("isVerified", false);
			if (userDao.isOtpExpired(email)) {
				model.addAttribute("msg", "OTP has expired. Please request a new one.");
			} else {
				model.addAttribute("msg", "Invalid OTP. Please try again.");
			}
			model.addAttribute("email", email);
			model.addAttribute("newPassword", newPassword);
			return ViewPaths.OTP_FORM;
		}
	}

	@PostMapping("resendOtp")
	public String resendOtp(String email, Model model) {
		return sendOTP(email, model);
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session, Model model) {
	    UserBean user = (UserBean) session.getAttribute("user");
	    String name = (user != null) ? user.getFirstName() : "User";

	    model.addAttribute("userName", name);
	    return ViewPaths.LOGOUT;
	}
	
	@PostMapping("logout")
	public String doLogout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/login";
	}
	
	@GetMapping("profile")
	public String profile() {
		return ViewPaths.Profile;
	}
}
