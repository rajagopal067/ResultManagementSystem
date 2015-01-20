package com.smf.bean;

import org.codehaus.jackson.annotate.JsonAutoDetect;

@JsonAutoDetect
public class ErrorBean {
	private String error;

	public ErrorBean(String err) {
		error = err;
	}

	/**
	 * @return the error
	 */
	public String getError() {
		return error;
	}

	/**
	 * @param error
	 *            the error to set
	 */
	public void setError(String error) {
		this.error = error;
	}
}
