package com.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Component
public class RoleBasedAccessInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        
        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession(false);
        
        // Skip for public endpoints
        if (isPublicEndpoint(requestURI)) {
            return true;
        }
        
        // Check if user is authenticated
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("/login");
            return false;
        }
        
        String userRole = (String) session.getAttribute("role");
        
        // Admin role checks
        if (isAdminEndpoint(requestURI)) {
            if (!"admin".equalsIgnoreCase(userRole)) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied: Admin role required");
                return false;
            }
        }
        
        // User role checks (both admin and users can access)
        if (isUserEndpoint(requestURI)) {
            if (!"admin".equalsIgnoreCase(userRole) && !"users".equalsIgnoreCase(userRole)) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied: User role required");
                return false;
            }
        }
        
        return true;
    }
    
    private boolean isPublicEndpoint(String uri) {
        return uri.equals("/") || uri.equals("/login") || uri.equals("/signup") || 
               uri.equals("/saveuser") || uri.equals("/forgotpassword") || 
               uri.equals("/verifyOtp") || uri.equals("/resendOtp") ||
               uri.startsWith("/css/") || uri.startsWith("/js/") || 
               uri.startsWith("/icons/") || uri.startsWith("/vendor/") || 
               uri.startsWith("/scss/") || uri.startsWith("/static/") ||
               uri.startsWith("/images/");
    }
    
    private boolean isAdminEndpoint(String uri) {
        return uri.equals("/admindashboard") || uri.startsWith("/admin/") || 
               uri.equals("/searchlog") || uri.equals("/deletesearchlog") || 
               uri.equals("/fetchdata");
    }
    
    private boolean isUserEndpoint(String uri) {
        return uri.equals("/userdashboard") || uri.startsWith("/user/") || 
               uri.equals("/home") || uri.equals("/profile");
    }
}
