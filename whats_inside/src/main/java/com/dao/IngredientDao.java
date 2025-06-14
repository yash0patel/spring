package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.IngredientBean;

@Repository
public class IngredientDao {
	@Autowired
	JdbcTemplate stmt;
	
	public void addIngredient(IngredientBean ingredientBean)
	{
		stmt.update("INSERT INTO ingredients (name, scientificName, commonUsage, avoidBy, fda, fssai, efsa) VALUES (?, ?, ?, ?, ?, ?, ?)",
	            ingredientBean.getName(),
	            ingredientBean.getScientificName(),
	            ingredientBean.getCommonUsage(),
	            ingredientBean.getAvoidBy(), // This should be a comma-separated String
	            ingredientBean.getFda(),
	            ingredientBean.getFssai(),
	            ingredientBean.getEfsa());
	}
	
	public List<IngredientBean> listIngredients()
	{
		List<IngredientBean> list = stmt.query("select * from ingredients", new BeanPropertyRowMapper<>(IngredientBean.class));
		return list;
	}
	
	public IngredientBean getIngredientById(Integer id)
	{
		List<IngredientBean> list = stmt.query("select * from ingredients where ingredientId = ?",new BeanPropertyRowMapper<>(IngredientBean.class), id );
		return list.get(0);
	}
}
