package com.dao;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.bean.UserBean;

@Repository
public class UserDao {

	
	@Autowired
	JdbcTemplate stmt;
	@Autowired
	PasswordEncoder passwordEncoder;

	
	public void adduser(UserBean user)
	{
		stmt.update("insert into users(firstName,lastName,gender,email,password) values(?,?,?,?,?)",user.getFirstName(),user.getLastName(),user.getGender(),user.getEmail(),user.getPassword());
	}
	
	public List<UserBean> getAllUsers()
	{
		List<UserBean> users = stmt.query("select * from users", new BeanPropertyRowMapper<>(UserBean.class));
		return users;
	}
	
	public boolean authenticate(String email,String password)
	{
		try {
			UserBean userBean = stmt.queryForObject("select * from users where email = ?", new BeanPropertyRowMapper<>(UserBean.class),new Object[] {email});			
			if(userBean != null)
			{
				return passwordEncoder.matches(password, userBean.getPassword());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public boolean isEmailRegistered(String email)
	{
		try {
			UserBean userBean = stmt.queryForObject("select * from users where email = ?", new BeanPropertyRowMapper<>(UserBean.class),new Object[] {email});			
			return userBean!=null?true:false;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	
	public String generateOtp() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);  // 6-digit OTP from 100000 to 999999
        return String.valueOf(otp);
	}
	
	public Boolean setOtp(String email,String otp)
	{
	    LocalDateTime createdAt = LocalDateTime.now();
	    LocalDateTime expiresAt = createdAt.plusMinutes(5);
	    
	    Integer count = stmt.queryForObject("select count(*) from otp_verification where email = ?", Integer.class ,email);
	    int rowsAffected = 0;
	    if(count == 1)
	    {
	    	String sql = "update otp_verification set otp = ?, created_at = ?, expires_at = ? WHERE email = ?";
	    	rowsAffected = stmt.update(sql,otp,createdAt,expiresAt,email);
	    }
	    else
	    {
	    	String sql = "INSERT INTO otp_verification (email, otp, created_at, expires_at) VALUES (?, ?, ?, ?)";
	    	rowsAffected = stmt.update(sql,email,otp,createdAt,expiresAt);	    	
	    }
	    
	    return rowsAffected > 0;
	}
	
	public Boolean verifyOtp(String email,String otp)
	{
		String sql = "select count(*) from otp_verification where email = ? and otp = ? and expires_at > ?";
	    Integer count = stmt.queryForObject(sql, Integer.class, email, otp, LocalDateTime.now());
	    return count == 1;
	}
	
	public Boolean changeUserPassword(String email, String newPassword) {
	    String sql = "update users set password = ? where email = ?";
	    int rowsAffected = stmt.update(sql, passwordEncoder.encode(newPassword), email);
	    return rowsAffected > 0;
	}
	
	public boolean isOtpExpired(String email) {
		try {
			String sql = "select expires_at from otp_verification where email = ?";
			LocalDateTime expiresAt = stmt.queryForObject(sql, LocalDateTime.class, email);
			return expiresAt.isBefore(LocalDateTime.now());			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}

	public String getRoleByEmail(String email) {
		try {
			UserBean userBean = stmt.queryForObject("select * from users where email = ?", new BeanPropertyRowMapper<>(UserBean.class),new Object[] {email});
			return userBean.getRole();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "";
	}
	
}
