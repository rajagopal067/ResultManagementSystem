package com.smf.service;

import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import com.smf.bean.ExcelUploadBean;
import com.smf.bean.User;
@Service
public interface ExcelUploadService {
	
	String getQueryResult(List<String> queryTokenList);

	Object uploadExcel(ExcelUploadBean excelUploadBean, XSSFWorkbook workBook, User user);
}
