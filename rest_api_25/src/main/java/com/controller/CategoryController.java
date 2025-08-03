package com.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bean.CategoryBean;

@RestController
@RequestMapping("category")
public class CategoryController {
	
	//add Category
	@PostMapping
	public ResponseEntity<?> addCategory(@RequestBody CategoryBean categoryBean) {
		// insert logic (dao)
//		return ResponseEntity.ok(categoryBean);
		return ResponseEntity.status(HttpStatus.CREATED).body(categoryBean);
	}
}
