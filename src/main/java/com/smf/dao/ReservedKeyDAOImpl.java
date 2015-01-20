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




public class ReservedKeyDAOImpl implements ReservedKeyDAO {
	
	
	public static final String checkKeyword = "select * from reserved_keywords where resKeyword=?";
	private JdbcTemplate jdbcTemplate;

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public boolean verifyKeyword(final String keyword) {
		 return jdbcTemplate.execute(checkKeyword,
				new PreparedStatementCallback() {
					@Override
					public Object doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {
					    ps.setString(1, keyword);
						ResultSet keywordResultSet = ps.executeQuery();
						//System.out.println("keywordResultSet.next()="+keywordResultSet.next());
						
						if (keywordResultSet.next()) {
					   System.out.println("inside keyword resultset");
							return true;
						}
						else {
						return false;
						}
					}
		
				});
		 //Here lies the problem 
		//return false;
	}
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

}
