package com.smf.endpoints;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smf.bean.ExcelUploadBean;
import com.smf.bean.SuccessBean;
import com.smf.bean.User;
import com.smf.service.ExcelUploadService;
import com.smf.service.UserService;

@Controller(value = "/services")
// TODO: integrate user_info, currently hardcoded with 1
public class ExcelEndPoint {
	private ExcelUploadService excelUploadService;
	private UserService userService;

	@RequestMapping(value = "/excel-upload", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@ResponseBody
	@Transactional
	public Object postUploadExcel(
			@ModelAttribute(value = "excelUploadBean") ExcelUploadBean excelUploadBean) {
		if (excelUploadBean.getFile() == null) {
			return new Error("Please upload the file");
		}
		// For now hardcoding it, delete it
		excelUploadBean.setKeyword("crt");
//		if (excelUploadBean.getUname() == null
//				|| excelUploadBean.getUname().isEmpty()) {
//			return new Error("UserName is empty");
//		}
//
		User user = userService.getUser(excelUploadBean.getKeyword());
		XSSFWorkbook workbook = null;
		try {
			workbook = new XSSFWorkbook(excelUploadBean.getFile()
					.getInputStream());
		} catch (IOException e) {
			return new Error("Error Processing file");
		}
		return excelUploadService.uploadExcel(excelUploadBean, workbook, user);
	}

	@RequestMapping(value = "/results", method = RequestMethod.GET, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	@ResponseBody
	public Object getExcelWithHeader(@RequestParam(value = "query") String query) {
		if (query == null || query.isEmpty()) {
			return new Error("Invalid query. Type in atleast three words");
		}
		String queryTokens[] = query.split(" ");
		if (queryTokens.length == 0) {
			return new Error("Invalid query. Type in atleast three words");
		}

		List<String> queryTokensList = new ArrayList<String>();
		for (String queryToken : queryTokens) {
			if (!queryToken.trim().isEmpty()) {
				queryTokensList.add(queryToken.trim());
			}
		}

		if (queryTokensList.size() < 3) {
			return new Error(
					"Atleast three words required to make a valid query!");
		}
		return new SuccessBean(
				excelUploadService.getQueryResult(queryTokensList));
	}

	/**
	 * @param excelUploadService
	 *            the excelUploadService to set
	 */
	@Autowired
	public void setExcelUploadService(ExcelUploadService excelUploadService) {
		this.excelUploadService = excelUploadService;
	}

	/**
	 * @param userService
	 *            the userService to set
	 */
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
