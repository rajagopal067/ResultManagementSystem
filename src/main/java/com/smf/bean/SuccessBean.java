package com.smf.bean;

import org.codehaus.jackson.annotate.JsonAutoDetect;

@JsonAutoDetect
public class SuccessBean {
	private String success;

	public SuccessBean(String err) {
		setSuccess(err);
	}

	/**
	 * @return the success
	 */
	public String getSuccess() {
		return success;
	}

	/**
	 * @param success the success to set
	 */
	public void setSuccess(String success) {
		this.success = success;
	}
}
