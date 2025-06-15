package com.bean;

import jakarta.validation.constraints.NotBlank;

public class UserBean {
	@NotBlank(message = "please Enter FirstName")
	private String firstName;
	@NotBlank(message = "please Enter LastName")
	private String lastName;
	@NotBlank(message = "please Enter Email")
	private String email;
	@NotBlank(message = "please Enter Password")
	private String password;
	@NotBlank(message = "please Enter Gender")
	private String gender;
	
	private String role;
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
}
