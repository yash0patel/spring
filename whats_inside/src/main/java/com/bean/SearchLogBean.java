package com.bean;

import java.sql.Timestamp;

public class SearchLogBean {

    private int id;
    private String search_term;
    private Timestamp searched_at;

    private String firstName;
    private String email;
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSearch_term() {
		return search_term;
	}
	public void setSearch_term(String search_term) {
		this.search_term = search_term;
	}
	public Timestamp getSearched_at() {
		return searched_at;
	}
	public void setSearched_at(Timestamp searched_at) {
		this.searched_at = searched_at;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
