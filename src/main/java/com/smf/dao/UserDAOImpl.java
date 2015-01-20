package com.smf.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.smf.bean.User;

public class UserDAOImpl implements UserDAO {
	public static final String insertUser = "insert into user_info(orgname, orgtype, keyword, email, password, phone, address) values(?,?,?,?,?,?,?)";
	public static final String getUser = "select * from user_info where keyword=?";
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public User getUser(final String keyword) {
		return (User) jdbcTemplate.execute(getUser,
				new PreparedStatementCallback() {
					@Override
					public Object doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {
						ps.setString(1, keyword);
						ResultSet userResultSet = ps.executeQuery();
						if (userResultSet.next()) {
							User user = new User();
							user.setUser_info_pk(userResultSet
									.getInt("user_info_pk"));
							user.setKeyword(userResultSet.getString("keyword"));
							user.setPhone(userResultSet.getString("phone"));
							user.setPassword(userResultSet.getString("password"));
							user.setVerification(userResultSet.getString("verification"));
							return user;
						}
						return null;
					}
				});
	}

	@Override
	public void postUser(final User user) {
		System.out.println(user.getAddress());
		try {
		jdbcTemplate.update(insertUser, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, user.getOrgname());
				ps.setString(2, "Education");
				ps.setString(3, user.getKeyword());
				ps.setString(4, user.getEmail());
				ps.setString(5, user.getPassword());
				ps.setString(6, user.getPhone());
				ps.setString(7, user.getAddress());
				ps.execute();
			}
		});
		} catch (Exception e)
		{
			
		}
		
	System.out.println("insert Done");
	}

	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

}
