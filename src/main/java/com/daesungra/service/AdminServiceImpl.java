package com.daesungra.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daesungra.dao.AdminDao;
import com.daesungra.domain.BoardReportVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<BoardReportVo> getBoardReportList (Map<String, Object> pagenatedInputData) {
		List<BoardReportVo> brvoList = adminDao.selectBoardReportList(pagenatedInputData);
		
		return brvoList;
	}
}
