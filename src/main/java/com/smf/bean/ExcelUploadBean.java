package com.smf.bean;

import org.springframework.web.multipart.MultipartFile;

public class ExcelUploadBean {
	private MultipartFile file;
	private String excelTitle;
	private String excelDescription;
	private boolean containsHeaders;
	private String data_stored_in;
	private int version=1;
	private int with_header;
	private int user_info_fk;
	private String keyword;

	/**
	 * @return the file
	 */
	public MultipartFile getFile() {
		return file;
	}

	/**
	 * @param file
	 *            the file to set
	 */
	public void setFile(MultipartFile file) {
		this.file = file;
	}

	/**
	 * @return the excelTitle
	 */
	public String getExcelTitle() {
		return excelTitle;
	}

	/**
	 * @param excelTitle
	 *            the excelTitle to set
	 */
	public void setExcelTitle(String excelTitle) {
		this.excelTitle = excelTitle;
	}

	/**
	 * @return the excelDescription
	 */
	public String getExcelDescription() {
		return excelDescription;
	}

	/**
	 * @param excelDescription
	 *            the excelDescription to set
	 */
	public void setExcelDescription(String excelDescription) {
		this.excelDescription = excelDescription;
	}

	/**
	 * @return the containsHeaders
	 */
	public boolean isContainsHeaders() {
		return containsHeaders;
	}

	/**
	 * @param containsHeaders
	 *            the containsHeaders to set
	 */
	public void setContainsHeaders(boolean containsHeaders) {
		this.containsHeaders = containsHeaders;
	}

	/**
	 * @return the data_stored_in
	 */
	public String getData_stored_in() {
		return data_stored_in;
	}

	/**
	 * @param data_stored_in the data_stored_in to set
	 */
	public void setData_stored_in(String data_stored_in) {
		this.data_stored_in = data_stored_in;
	}

	/**
	 * @return the version
	 */
	public int getVersion() {
		return version;
	}

	/**
	 * @param version the version to set
	 */
	public void setVersion(int version) {
		this.version = version;
	}

	/**
	 * @return the with_header
	 */
	public int getWith_header() {
		return with_header;
	}

	/**
	 * @param with_header the with_header to set
	 */
	public void setWith_header(int with_header) {
		this.with_header = with_header;
	}

	/**
	 * @return the user_info_fk
	 */
	public int getUser_info_fk() {
		return user_info_fk;
	}

	/**
	 * @param user_info_fk the user_info_fk to set
	 */
	public void setUser_info_fk(int user_info_fk) {
		this.user_info_fk = user_info_fk;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	

}
