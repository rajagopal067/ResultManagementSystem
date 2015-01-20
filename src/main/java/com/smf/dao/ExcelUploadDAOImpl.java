package com.smf.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import com.smf.bean.ExcelUploadBean;
import com.smf.bean.SheetInfo;

public class ExcelUploadDAOImpl implements ExcelUploadDAO {
	private JdbcTemplate jdbcTemplate;
	public static final String WITHOUT_HEADER_NAME = "data_woh_";
	public static final String WITH_HEADER_NAME = "data_wh_";
	public static final String COL_PREFIX = "value";
	public static final String WITH_HEADER_FK = "sheet_header_fk";
	public static final String WHITHOUT_HEADER_FK = "sheet_info_fk";
	public static final String getInfo = "select column2 from data_without_headers_2 where column1=?";
	public static final String insertSheetInfo = "insert into sheet_info(title, data_stored_in, description, version, with_header,code,"
			+ " user_info_fk) values(?,?,?,?,?,?,?)";
	public static final String getSheetInfo = "select * from sheet_info where code=? and title=?";
	public static final String getSheetHeaders = "select * from sheet_header where sheet_info_fk=?";

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private SheetInfo getSheetInfo(final String code, final String title) {
		return (SheetInfo) jdbcTemplate.execute(getSheetInfo,
				new PreparedStatementCallback() {
					@Override
					public Object doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {
						ps.setString(1, code.toLowerCase());
						ps.setString(2, title.toLowerCase());
						ResultSet sheetResult = ps.executeQuery();
						if (sheetResult.next()) {
							SheetInfo sheetInfo = new SheetInfo();
							sheetInfo.setData_stored_in(sheetResult
									.getString("Data_stored_in"));
							sheetInfo.setDescription(sheetResult
									.getString("description"));
							sheetInfo.setSheet_info_pk(sheetResult
									.getInt("sheet_info_pk"));
							sheetInfo.setTitle(sheetResult.getString("title"));
							sheetInfo.setUser_info_fk(sheetResult
									.getInt("user_info_fk"));
							sheetInfo.setVersion(sheetResult.getInt("version"));
							sheetInfo.setWith_header(sheetResult
									.getInt("with_header"));
							return sheetInfo;
						}
						return null;
					}
				});
	}

	@Override
	public String getQuery(List<String> queryList) {
		String code = queryList.get(0);
		String title = queryList.get(1);
		SheetInfo sheetInfo = getSheetInfo(code, title);
		String tableSplit[] = ((String) sheetInfo.getData_stored_in())
				.split("_");
		int tableSize = Integer.valueOf(tableSplit[tableSplit.length - 1]);

		if ((Integer) sheetInfo.getWith_header() == 0) {
			List<String> data = getFromDataTables(false,
					sheetInfo.getSheet_info_pk(), queryList.get(2), tableSize,
					sheetInfo.getData_stored_in());
			return processData(data);
		} else {
			//TODO: change headers to a headerBean for better coding standards
			List<String> headers = getHeaders(sheetInfo.getSheet_info_pk(),
					tableSize);
			List<String> data = getFromDataTables(true,
					Integer.valueOf(headers.get(headers.size() - 1)),
					queryList.get(2), tableSize, sheetInfo.getData_stored_in());
			//removing the last node as it carries a foregin key of header.
			headers.remove(headers.size()-1);
			return processData(headers, data);
		}
	}

	private String processData(List<String> headers, List<String> data) {
		StringBuffer sb = new StringBuffer();
		int i = 0;
		for (String header : headers) {
			sb.append(header + ": " + data.get(i++) + ";");
		}
		return sb.toString();
	}

	private String processData(List<String> data) {
		StringBuffer sb = new StringBuffer();
		for (String dataEntry : data) {
			sb.append(dataEntry + ";");
		}
		return sb.toString();
	}

	@SuppressWarnings("unchecked")
	private List<String> getHeaders(final int sheet_info_pk, final int tableSize) {
		return (List<String>) jdbcTemplate.execute(getSheetHeaders,
				new PreparedStatementCallback() {

					@Override
					public Object doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {

						ps.setInt(1, sheet_info_pk);
						ResultSet rs = ps.executeQuery();
						if (rs.next()) {
							List<String> strList = new ArrayList<String>();
							for (int i = 2; i <= tableSize; i++) {
								strList.add(rs.getString("name" + i));
							}
							strList.add(String.valueOf(rs
									.getInt("sheet_header_pk")));
							return strList;
						}
						return "";
					}
				});

	}

	@SuppressWarnings("unchecked")
	private List<String> getFromDataTables(final boolean fromHeader,
			final Integer info_pk, final String queryId,
			final Integer tableSize, final String tableName) {
		String key = "sheet_info_fk";
		if (fromHeader) {
			key = "sheet_header_fk";
		}
		String sql = "select * from " + tableName + " where " + key + "=?"
				+ " and col1=?";

		return (List<String>) jdbcTemplate.execute(sql,
				new PreparedStatementCallback() {

					@Override
					public Object doInPreparedStatement(PreparedStatement ps)
							throws SQLException, DataAccessException {

						ps.setInt(1, info_pk);
						ps.setString(2, queryId);
						ResultSet rs = ps.executeQuery();
						if (rs.next()) {
							List<String> strList = new ArrayList<String>();
							for (int i = 2; i <= tableSize; i++) {
								strList.add(rs.getString("col" + i));
							}
							return strList;
						}
						return null;
					}
				});
	}

	@Override
	public int insertSheetInformation(final ExcelUploadBean sheetInfoBean) {
		KeyHolder holder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(
					Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(
						insertSheetInfo, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, sheetInfoBean.getExcelTitle());
				ps.setString(2, sheetInfoBean.getData_stored_in());
				ps.setString(3, sheetInfoBean.getExcelDescription());
				ps.setInt(4, sheetInfoBean.getVersion());
				ps.setInt(5, sheetInfoBean.getWith_header());
				ps.setString(6, sheetInfoBean.getKeyword());
				ps.setInt(7, sheetInfoBean.getUser_info_fk());
				return ps;
			}
		}, holder);
		return holder.getKey().intValue();

	}

	@Override
	public int insertHeader(final String[] headers, final int sheetInfoId) {
		final StringBuffer query = new StringBuffer("insert into sheet_header");
		int i = 1;
		StringBuffer rowNames = new StringBuffer(20);
		StringBuffer rowValues = new StringBuffer(20);
		for (String header : headers) {
			if (header == null) {
				break;
			}
			rowNames.append("name").append(i++).append(",");
			rowValues.append("?").append(",");
		}
		rowNames.append("sheet_info_fk");
		rowValues.append("?");
		query.append("(").append(rowNames.toString()).append(")")
				.append(" values ").append("(").append(rowValues.toString())
				.append(")");
		KeyHolder holder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(
					Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(
						query.toString(), Statement.RETURN_GENERATED_KEYS);
				int i = 1;
				for (; i <= headers.length; i++) {
					ps.setString(i, headers[i - 1]);
				}
				ps.setInt(i, sheetInfoId);
				return ps;
			}
		}, holder);
		return holder.getKey().intValue();
	}

	@Override
	public void uploadExcel(final List<String[]> data, final Integer fKId,
			boolean withHeader) {
		final int colsCount = data.get(0).length;
		String tableName = WITHOUT_HEADER_NAME + colsCount;
		String foreignKey = WHITHOUT_HEADER_FK;
		if (withHeader) {
			tableName = WITH_HEADER_NAME + colsCount;
			foreignKey = WITH_HEADER_FK;
		}
		StringBuffer batchInsertSQL = new StringBuffer("insert into ")
				.append(tableName);
		int i = 1;
		StringBuffer rowNames = new StringBuffer(20);
		StringBuffer rowValues = new StringBuffer(20);
		for (; i <= colsCount; i++) {
			rowNames.append("col").append(i).append(",");
			rowValues.append("?").append(",");
		}
		rowNames.append(foreignKey);
		rowValues.append("?");
		batchInsertSQL.append("(").append(rowNames.toString()).append(")")
				.append(" values ").append("(").append(rowValues.toString())
				.append(")");

		jdbcTemplate.batchUpdate(batchInsertSQL.toString(),
				new BatchPreparedStatementSetter() {

					public void setValues(PreparedStatement ps, int i)
							throws SQLException {
						String col[] = data.get(i);
						int j = 1;
						for (; j <= colsCount; j++) {
							ps.setString(j, col[j - 1]);
						}
						ps.setInt(j, fKId);
					}

					public int getBatchSize() {
						return data.size();
					}
				});

	}
}
