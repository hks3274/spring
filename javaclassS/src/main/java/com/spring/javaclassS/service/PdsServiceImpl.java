package com.spring.javaclassS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javaclassS.dao.PdsDAO;
import com.spring.javaclassS.vo.PdsVO;

@Service
public class PdsServiceImpl implements PdsService {
	@Autowired
	PdsDAO pdsDAO;

	@Override
	public List<PdsVO> getPdsList() {
		return pdsDAO.getPdsList();
	}
}
