package com.controller;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        Object requestUri = request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI);

        model.addAttribute("errorCode", status != null ? status.toString() : "Unknown");
        model.addAttribute("requestUri", requestUri != null ? requestUri.toString() : "");
        model.addAttribute("errorTitle", "Something went wrong");
        model.addAttribute("errorDescription", "The page you are looking for might have been removed or is temporarily unavailable.");

        if (status != null) {
            int statusCode = Integer.parseInt(status.toString());
            if (statusCode == 404) {
                model.addAttribute("errorTitle", "Page Not Found");
                model.addAttribute("errorDescription", "The page you requested does not exist.");
                return "error/404";
            }
        }
        return "error/error";
    }
}
