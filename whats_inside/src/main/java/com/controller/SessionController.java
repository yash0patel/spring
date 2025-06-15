package com.controller;

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

@Controller
public class SessionController {

    @Autowired
	JavaMailSender mailSender;
	@Autowired
	UserDao userDao;
	@Autowired
	PasswordEncoder passwordEncoder;


	@GetMapping("signup")
	public String signup()
	{
		return "Signup";
	}
	
	@GetMapping(value = {"login","/"})
	public String login()
	{
		return "Login";
	}
	
	@PostMapping("saveuser")
	public String saveUser(@Validated UserBean user,BindingResult result, Model model)
	{
		if(result.hasErrors())
		{
			model.addAttribute("result",result);
			return "Signup";
		}
		else
		{
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
			
			return "Login";
		}
	}
	
	@PostMapping("/login")
	public String authenticate(String email,String password,Model model)
	{
		boolean isAuthenticated = userDao.authenticate(email, password);
		if(!isAuthenticated)
		{
			model.addAttribute("error","invalide login detail");
			return "Login";
		}
		if(userDao.getRoleByEmail(email).equals("users"))
		{
			return"redirect:/home";			
		}
		else if(userDao.getRoleByEmail(email).equals("admin"))
		{
			return"redirect:/admindashboard";			
		}
		
		return"redirect:/listingredients";		
		
	}
	
	@GetMapping("forgotpassword")
	public String forgotPassword()
	{
		return "ForgotPassword";
	}
	
	@PostMapping("forgotpassword")
	public String sendOTP(String email,Model model)
	{
		if(email == null || !userDao.isEmailRegistered(email))
		{
			model.addAttribute("error", "Insert a correct or valid email");
			return "ForgotPassword";			
		}
		try {
            // Load HTML template from resources
            Resource resource = new ClassPathResource("templates/sendOtpEmail.html");
            String htmlContent = new String(Files.readAllBytes(resource.getFile().toPath()));

            // Prepare the email
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);

            String otp = userDao.generateOtp();
            if(!userDao.setOtp(email,otp))
            {
            	model.addAttribute("error","Server error, please try again");
            	return "ForgotPassword";
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
		
		model.addAttribute("email",email);
		
		return "OtpForm";
	}
	
	@PostMapping("verifyOtp")
	public String verifyOtp(String email,String otp,String newPassword,Model model)
	{
		if(userDao.verifyOtp(email, otp))
		{
			model.addAttribute("msg","OTP verified successfully!");
			model.addAttribute("isVerified",true);
			
			if(newPassword.length() == 0 || newPassword == null)
			{
				model.addAttribute("msg","Enter Valide password!");
				model.addAttribute("email",email);
				model.addAttribute("otp",otp);
				return "OtpForm";
			}
			
			if(!userDao.changeUserPassword(email, newPassword))
			{
				model.addAttribute("error", "Failed to update password. Please try again later.");
			}
			
			model.addAttribute("email",email);
			return "Login";	
		}
		else {
			model.addAttribute("isVerified",false);
			if (userDao.isOtpExpired(email)) {
			    model.addAttribute("msg", "OTP has expired. Please request a new one.");				
			} else {
			    model.addAttribute("msg", "Invalid OTP. Please try again.");
			}
	        model.addAttribute("email", email);
	        model.addAttribute("newPassword",newPassword);
	        return "OtpForm";
	    }
	}
	
	@PostMapping("resendOtp")
	public String resendOtp(String email,Model model)
	{
		return sendOTP(email, model);
	}
}
