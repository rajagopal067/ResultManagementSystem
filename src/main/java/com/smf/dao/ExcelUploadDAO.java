package com.smf.dao;

import java.util.List;

import com.smf.bean.ExcelUploadBean;

public interface ExcelUploadDAO {
	String getQuery(List<String> queryTokenList);

	int insertSheetInformation(final ExcelUploadBean sheetInfoBean);

	int insertHeader(String[] headers, int sheetInfoId);

	void uploadExcel(final List<String[]> data, final Integer fKId,
			boolean withHeader);
}
