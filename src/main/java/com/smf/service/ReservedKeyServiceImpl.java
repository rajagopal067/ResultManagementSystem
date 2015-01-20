package com.smf.service;


import org.springframework.beans.factory.annotation.Autowired;

import com.smf.dao.ReservedKeyDAO;

public class ReservedKeyServiceImpl implements ReservedKeyService {
	private ReservedKeyDAO reservedKeyDAO;

	@Override
	public boolean verifyKeyword(String keyword) {
		return  getReservedKeyDAO().verifyKeyword(keyword);
	}

//	public int ReservedKeyDAO() {
//		// TODO Auto-generated method stub
//		return 0;
//	}

	public ReservedKeyDAO getReservedKeyDAO() {
		return reservedKeyDAO;
	}

	@Autowired
	public void setReservedKeyDAO(ReservedKeyDAO reservedKeyDAO) {
		this.reservedKeyDAO = reservedKeyDAO;
	}

}
