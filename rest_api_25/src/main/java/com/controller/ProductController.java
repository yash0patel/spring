package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bean.ProductBean;
import com.dao.ProductDao;

@RestController
public class ProductController {
	
	@Autowired
	ProductDao productDao;
	
	//add product
	@PostMapping("product")
	public ProductBean addProduct(@RequestBody ProductBean productBean) {
		productDao.addProduct(productBean);
		return productBean;
	}
	
	//list products
	@GetMapping("product")
	public List<ProductBean> getAllProducts() {
		List<ProductBean> products = productDao.getAllProducts();
		return products;
	}
	
	//delete product
	@DeleteMapping("product/{productId}")
	public ProductBean deleteProduct(@PathVariable Integer productId) {
		ProductBean productBean = productDao.getProductById(productId);
		
		if(productBean == null) {
			return null;
		}
		
		productDao.deleteProduct(productId);
		return productBean;
	}
}
