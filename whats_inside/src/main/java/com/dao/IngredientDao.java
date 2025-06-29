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
	
	public Long getNextId(long id)
	{
		try {
	        Long nextId = stmt.queryForObject("SELECT MIN(ingredientId) FROM ingredients WHERE ingredientId > ?",Long.class,id);
	        return nextId;
	    } catch (Exception e) {
	        return null;
	    }
	}
	
	public List<IngredientBean> searchIngredientByName(String name) {
        String sql = "SELECT * FROM ingredients WHERE name LIKE ? OR scientificName LIKE ?";
        return stmt.query(
            sql,
            new BeanPropertyRowMapper<>(IngredientBean.class),
            "%" + name + "%", "%" + name + "%"
        );
    }
	
	public void deleteIngredientById(Integer id) {
	    String sql = "DELETE FROM ingredients WHERE ingredientId = ?";
	    stmt.update(sql, id);
	}
	
	public void updateIngredient(IngredientBean ingredientBean) {
	    String sql = "UPDATE ingredients SET name = ?, scientificName = ?, commonUsage = ?, avoidBy = ?, fda = ?, fssai = ?, efsa = ? WHERE ingredientId = ?";
	    stmt.update(sql,
	        ingredientBean.getName(),
	        ingredientBean.getScientificName(),
	        ingredientBean.getCommonUsage(),
	        ingredientBean.getAvoidBy(),
	        ingredientBean.getFda(),
	        ingredientBean.getFssai(),
	        ingredientBean.getEfsa(),
	        ingredientBean.getIngredientId()
	    );
	}
}
