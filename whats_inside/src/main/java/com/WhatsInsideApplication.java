package com;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.reactive.function.client.WebClient;

@SpringBootApplication
public class WhatsInsideApplication {

	public static void main(String[] args) {
		SpringApplication.run(WhatsInsideApplication.class, args);
	}
	
	@Bean
	PasswordEncoder getEncoder()
	{
		return new BCryptPasswordEncoder();
	}
	
	@Value("${huggingface.api.key}")
	private String huggingKey;
	
	@Bean
	public WebClient huggingFaceClient() {
	    return WebClient.builder()
	            .baseUrl("https://api-inference.huggingface.co")
	            .defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + huggingKey)
	            .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
	            .build();
	}
	
	@Bean
	public WebClient openRouterClient(@Value("${openrouter.api.key}") String apiKey) {
	    return WebClient.builder()
	        .baseUrl("https://openrouter.ai")
	        .defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + apiKey)
	        .defaultHeader("HTTP-Referer", "http://localhost:3025") // your domain or localhost
	        .defaultHeader("X-Title", "whats_inside") // app/project name
	        .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
	        .build();
	}



}


