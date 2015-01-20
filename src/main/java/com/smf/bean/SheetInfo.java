package com.smf.bean;

public class SheetInfo {
private int sheet_info_pk;
private String title;
private String data_stored_in;
private String description;
private int version;
private int with_header;
private int user_info_fk;
/**
 * @return the sheet_info_pk
 */
public int getSheet_info_pk() {
	return sheet_info_pk;
}
/**
 * @param sheet_info_pk the sheet_info_pk to set
 */
public void setSheet_info_pk(int sheet_info_pk) {
	this.sheet_info_pk = sheet_info_pk;
}
/**
 * @return the title
 */
public String getTitle() {
	return title;
}
/**
 * @param title the title to set
 */
public void setTitle(String title) {
	this.title = title;
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
 * @return the description
 */
public String getDescription() {
	return description;
}
/**
 * @param description the description to set
 */
public void setDescription(String description) {
	this.description = description;
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
}
