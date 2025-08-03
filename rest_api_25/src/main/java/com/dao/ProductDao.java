package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.ProductBean;

@Repository
public class ProductDao {

	@Autowired
	JdbcTemplate stmt;

	public void addProduct(ProductBean productBean) {
		stmt.update("insert into products (productName,category,price,qty) values (?,?,?,?)",
				productBean.getProductName(), productBean.getCategory(), productBean.getPrice(), productBean.getQty());
	}

	public List<ProductBean> getAllProducts() {
		return stmt.query("select * from products", new BeanPropertyRowMapper<>(ProductBean.class));
	}

	public void deleteProduct(Integer productId) {

		stmt.update("delete from products where productId = ? ", productId);
	}

	public ProductBean getProductById(Integer productId) {
		try {
			return stmt.queryForObject("select * from products where productId = ? ",
					new BeanPropertyRowMapper<>(ProductBean.class), new Object[] { productId });
		} catch (Exception e) {
			return null;
		}
	}
}