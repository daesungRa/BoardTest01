package com.daesungra.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daesungra.dao.AdminDao;
import com.daesungra.domain.BoardReportVo;
import com.daesungra.domain.BookVo;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	/*
	 * board report
	 */
	@Override
	public List<BoardReportVo> getBoardReportList (Map<String, Object> pagenatedInputData) {
		List<BoardReportVo> brvoList = adminDao.selectBoardReportList(pagenatedInputData);
		
		return brvoList;
	}
	@Override
	public BoardReportVo getBoardReportInfo (int serial) {
		BoardReportVo brvo = null;
		brvo = adminDao.selectBoardReportInfo(serial);
		
		return brvo;
	}
	@Override
	public boolean boardReportCompleteAction (int serial) {
		boolean result = false;
		result = adminDao.deleteBoardReport(serial);
		
		return result;
	}
	@Override
	public boolean boardBlockAction (int fSerial) {
		boolean result = false;
		result = adminDao.updateBoardBlockAction(fSerial);
		
		return result;
	}
	@Override
	public boolean boardBlockFreeAction (int fSerial) {
		boolean result = false;
		result = adminDao.updateBoardBlockFreeAction(fSerial);
		
		return result;
	}
	
	/*
	 * book register
	 */
	@Override
	public List<BookVo> getBookRegisterList (Map<String, Object> pagenatedInputData) {
		List<BookVo> bkvoList = null;
		bkvoList = adminDao.selectBookRegisterList(pagenatedInputData);
		
		return bkvoList;
	}
	@Override
	public BookVo getBookRegisterInfo (String bookNo) {
		BookVo bkvo = null;
		bkvo = adminDao.selectBookRegisterInfo (bookNo);
		
		return bkvo;
	}
	@Override
	public boolean prohibitBookRegister (String bookNo) {
		boolean result = false;
		result = adminDao.deleteBookRegisterInfo(bookNo);
		
		return result;
	}
	@Override
	public boolean permitBookRegister (BookVo bkvo) {
		boolean result = false;
		result = adminDao.updateBookRegisterInfo(bkvo);
		
		return result;
	}
}
