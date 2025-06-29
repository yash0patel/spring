package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.SearchLogBean;

@Repository
public class SearchLogDao {
	@Autowired
	JdbcTemplate stmt;

	public void logEmptySearch(String searchTerm) {
	    String sql = "INSERT INTO search_logs_empty (search_term) VALUES (?)";
	    stmt.update(sql, searchTerm);
	}
	
	public List<SearchLogBean> getAllLogs() {
		String query = "select s.id, s.search_term, s.searched_at, u.firstName, u.email from search_logs_empty s join users u on s.userId = u.userId";
	    return stmt.query(query, new BeanPropertyRowMapper<>(SearchLogBean.class));
	}
	
	public void deleteSearchLogById(Integer id) {
	    String sql = "DELETE FROM search_logs_empty WHERE id = ?";
	    stmt.update(sql, id);
	}
}
