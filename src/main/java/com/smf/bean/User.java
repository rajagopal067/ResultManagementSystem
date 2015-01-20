package com.smf.bean;

public class User {
	private int user_info_pk;
	private String orgname;
	private String keyword;
	private String email;
	private String password;
	private String phone;
	private String address;
	private String verification;

	/**
	 * @return the user_info_pk
	 */
	public int getUser_info_pk() {
		return user_info_pk;
	}

	/**
	 * @param user_info_pk
	 *            the user_info_pk to set
	 */
	public void setUser_info_pk(int user_info_pk) {
		this.user_info_pk = user_info_pk;
	}



	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone
	 *            the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getVerification() {
		return verification;
	}

	public void setVerification(String verification) {
		this.verification = verification;
	}
}
