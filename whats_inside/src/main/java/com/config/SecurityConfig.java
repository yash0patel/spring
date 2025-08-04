package com.config;

import com.dao.UserDao;
import com.service.CustomUserDetailsService;
import com.bean.UserBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    @Autowired
    private UserDao userDao;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(customUserDetailsService);
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(authz -> authz
                // Public endpoints (GET/POST)
                .requestMatchers("/", "/login", "/signup", "/saveuser", "/forgotpassword",
                                 "/verifyOtp", "/resendOtp","/home",
                                 "/css/**", "/js/**", "/icons/**", "/vendor/**", "/scss/**", "/images/**", "/static/**",
                                 "/WEB-INF/**").permitAll()

                // Admin-only endpoints with GET/POST paths added
                .requestMatchers("/admindashboard", "/admin/**", "/searchlog", "/deletesearchlog",
                                 "/fetchdata",
                                 "/newingredient", "/updateingredient", "/deleteingredient","/saveingredient",
                                 "/admin/AdminController/**", 
                                 "/admin/UserController/**").hasRole("ADMIN")

                // User + Admin accessible endpoints with both GET and POST common paths
                .requestMatchers("/userdashboard", "/user/**",
                                 "/home", "/profile",
                                 "/user/PaymentController/**",
                                 "/user/UserController/**").hasAnyRole("ADMIN", "USERS")

                // Any other requests require authentication
                .anyRequest().authenticated()
            )
            .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .usernameParameter("email")
                .passwordParameter("password")
                .successHandler(customAuthenticationSuccessHandler())
                .failureUrl("/login?error=true")
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout=true")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll()
            )
            .sessionManagement(session -> session
                .maximumSessions(1)
                .maxSessionsPreventsLogin(false)
            )
            .authenticationProvider(authenticationProvider());

        return http.build();
    }


    @Bean
    public AuthenticationSuccessHandler customAuthenticationSuccessHandler() {
        return new SimpleUrlAuthenticationSuccessHandler() {
            @Override
            public void onAuthenticationSuccess(HttpServletRequest request,
                                              HttpServletResponse response,
                                              Authentication authentication)
                                              throws IOException, ServletException {

                String role = authentication.getAuthorities().iterator().next().getAuthority();

                HttpSession session = request.getSession();

                String email = authentication.getName();
                UserBean user = userDao.getUserByEmail(email);

                session.setAttribute("user", user);
                session.setAttribute("role", role.replace("ROLE_", "").toLowerCase());

                if ("ROLE_ADMIN".equals(role)) {
                    setDefaultTargetUrl("/admindashboard");
                } else {
                    setDefaultTargetUrl("/userdashboard");
                }

                super.onAuthenticationSuccess(request, response, authentication);
            }
        };
    }
}
