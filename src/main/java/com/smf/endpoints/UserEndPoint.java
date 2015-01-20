package com.smf.endpoints;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.smf.bean.ErrorBean;
import com.smf.bean.SuccessBean;
import com.smf.bean.User;
import com.smf.service.UserService;
import com.smf.service.ReservedKeyService;

//hello

@Controller(value = "/user-services")

public class UserEndPoint {
	private UserService userService;
	private ReservedKeyService reservedKeyService;

	@RequestMapping(value = "/signup", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	@ResponseBody
	@Transactional
	public Object postUserInfo(@ModelAttribute(value = "user") User user) {
		if (isEmpty(user.getKeyword()) || isEmpty(user.getEmail())
				|| isEmpty(user.getPassword()) || isEmpty(user.getPhone())) {
			return new ErrorBean("Please fill all Details.");
		}
		userService.postUser(user);
		System.out.println(user.getKeyword());
		return new SuccessBean("User registered successfully.");
	}


	@RequestMapping(value = "/reservedKeyCheck", method = RequestMethod.GET, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	@ResponseBody
	public Object validateKeyword(@RequestParam(value = "keyword") String keyword) {
		//		JSONArray arrayObj=new JSONArray();
		//		 arrayObj.add("valid");
		if (isEmpty(keyword)) {
			return new SuccessBean("Keyword cannot be Empty.");
		}
		User userFromDB = userService.getUser(keyword);
		
		boolean isKeywordReserved = reservedKeyService.verifyKeyword(keyword);
		System.out.println("value of boolean in end point is:"+isKeywordReserved);

		if (isKeywordReserved){
			return new SuccessBean("Keyword is reserved");
		}
		else{
			if(userFromDB == null ) {
				return new SuccessBean("Keyword is available");
			}

			else {
				return new SuccessBean("Keyword is already taken");	
			}

		}
	}


	//---------------------------------------------------->
	//Adding signin webservice

	@RequestMapping(value = "/signin", method = RequestMethod.POST, produces = {
			MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE }, consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	@ResponseBody
	@Transactional
	public Object postUserCredentials(@ModelAttribute(value = "user") User user) {
		if (isEmpty(user.getKeyword()) || isEmpty(user.getPassword())) {
			return new ErrorBean("Username or Password is Empty.");
		}
		User userFromDB = userService.getUser(user.getKeyword());
		if(userFromDB == null ) {
			return new SuccessBean("Invalid Keyword");
		}

		if(userFromDB.getPassword().equals(user.getPassword())) {
			if(userFromDB.getVerification().equals("approved")){
				return new SuccessBean("Successfully logged in");
			}
			else {
				return new SuccessBean("Keyword is not authorized");	
			}
		} else {
			return new SuccessBean("Pasword is invalid");
		}

	}

	//----------------------------------------------------->


	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	private boolean isEmpty(String str) {
		return str == null || str.isEmpty();
	}


	@Autowired
	public void setReservedKeyService(ReservedKeyService reservedKeyService) {
		this.reservedKeyService = reservedKeyService;
	}



}
