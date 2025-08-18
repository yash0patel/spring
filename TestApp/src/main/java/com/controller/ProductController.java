package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.entity.ProductEntity;
import com.repository.ProductRepository;

@Controller
public class ProductController {

	@Autowired
	ProductRepository productRepository;

	@GetMapping("newproduct")
	public String newProduct() {
		return "NewProduct";
	}
	
	@PostMapping("saveproduct")
	public String saveProduct(ProductEntity productEntity) {
		productRepository.save(productEntity);
		return "redirect:/listproducts";
	}
	
	@GetMapping("listproducts")
	public String listProducts(Model model) {
	    model.addAttribute("products", productRepository.findAll());
	    return "ListProducts";
	}
	
	@GetMapping("/deleteProduct")
	public String deleteProduct(Integer id) {
		productRepository.deleteById(id);
		return "redirect:/listproducts";
	}
}
