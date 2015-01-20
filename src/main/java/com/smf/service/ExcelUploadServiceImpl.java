package com.smf.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.smf.bean.ExcelUploadBean;
import com.smf.bean.SuccessBean;
import com.smf.bean.User;
import com.smf.dao.ExcelUploadDAO;

public class ExcelUploadServiceImpl implements ExcelUploadService {
	private ExcelUploadDAO excelUploadDAO;
	
	@Override
	public String getQueryResult(List<String> queryTokenList) {
		return getExcelUploadDAO().getQuery(queryTokenList);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Object uploadExcel(ExcelUploadBean excelUploadBean,
			XSSFWorkbook workbook, User user) {

		XSSFSheet sheet = workbook.getSheetAt(0);
		int maxColumns = calculateMaxColumns(sheet);
		// By Default Setting it to no header case.
		// Change to data_woh_ and data_wh_
		excelUploadBean.setWith_header(0);
		excelUploadBean.setData_stored_in("data_woh_" + maxColumns);
		// IF it has headers
		boolean containHeaders = excelUploadBean.isContainsHeaders();
		if (containHeaders) {
			excelUploadBean.setWith_header(1);
			excelUploadBean.setData_stored_in("data_wh_" + maxColumns);
		}

		excelUploadBean.setUser_info_fk(user.getUser_info_pk());
		excelUploadBean.setKeyword(user.getKeyword());
		int sheetInfoId = excelUploadDAO
				.insertSheetInformation(excelUploadBean);
		List<String[]> data = new ArrayList<String[]>();
		int headerId = getContentsFromExcel(sheet, maxColumns, sheetInfoId,
				data, containHeaders);
		if (data.isEmpty()) {
			return new Error("Empty contents in the excel sheet !!!");
		}
		int uniqueId = sheetInfoId;
		if (containHeaders) {
			uniqueId = headerId;
		}
		excelUploadDAO.uploadExcel(data, uniqueId,
				excelUploadBean.isContainsHeaders());
		return new SuccessBean("Excel Sheet Successfully Uploaded!!");
	}

	private int getContentsFromExcel(Sheet sheet, int maxCols, int sheetInfoId,
			List<String[]> data, boolean isHeaderNotInserted) {
		int headerId = -1;
		Iterator<Row> rowIterator = sheet.iterator();
		while (rowIterator.hasNext()) {
			Row row = rowIterator.next();
			if (!isHeaderNotInserted) {
				String rowVals[] = populateData(row, maxCols);
				if (rowVals != null) {
					data.add(rowVals);
				}
			} else {
				String headers[] = populateData(row, maxCols);
				headerId = excelUploadDAO.insertHeader(headers, sheetInfoId);
				isHeaderNotInserted = false;
			}
		}
		return headerId;
	}

	private String[] populateData(Row row, int maxCols) {
		StringBuffer cellConcat = new StringBuffer();
		Iterator<Cell> cellIterator = row.cellIterator();
		String[] headers = new String[maxCols];
		int i = 0;
		while (cellIterator.hasNext()) {
			headers[i] = getCellValue(cellIterator.next()).trim();
			cellConcat.append(headers[i]);
			i++;
		}
		if (cellConcat.length() == 0) {
			return null;
		}
		return headers;
	}

	private int calculateMaxColumns(Sheet sheet) {
		int MAX_COLUMN = 0;
		int rowStart = sheet.getFirstRowNum();
		int rowEnd = sheet.getLastRowNum();

		for (int rowNum = rowStart; rowNum < rowEnd; rowNum++) {
			Row r = sheet.getRow(rowNum);

			int lastColumn = r.getLastCellNum();
			if (MAX_COLUMN < lastColumn) {
				MAX_COLUMN = lastColumn;
			}

		}
		return MAX_COLUMN;
	}

	private String getCellValue(Cell cell) {
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_BLANK:
			return "";
		case Cell.CELL_TYPE_BOOLEAN:
			return "" + cell.getBooleanCellValue();
		case Cell.CELL_TYPE_ERROR:
			return "" + cell.getErrorCellValue();
		case Cell.CELL_TYPE_FORMULA:
			return "" + cell.getCellFormula();
		case Cell.CELL_TYPE_NUMERIC:
			return "" + cell.getNumericCellValue();
		case Cell.CELL_TYPE_STRING:
			return cell.getStringCellValue();
		default:
			return "";
		}
	}

	/**
	 * @return the excelUploadDAO
	 */
	public ExcelUploadDAO getExcelUploadDAO() {
		return excelUploadDAO;
	}

	/**
	 * @param excelUploadDAO
	 *            the excelUploadDAO to set
	 */
	@Autowired
	public void setExcelUploadDAO(ExcelUploadDAO excelUploadDAO) {
		this.excelUploadDAO = excelUploadDAO;
	}

}
