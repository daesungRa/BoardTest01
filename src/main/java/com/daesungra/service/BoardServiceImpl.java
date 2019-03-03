package com.daesungra.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daesungra.dao.BoardDao;
import com.daesungra.domain.BoardVo;
import com.daesungra.domain.BookVo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardVo> getBoardListDate (int category) {
		List<BoardVo> result = boardDao.getBoardListDate(category);
		
		return result;
	}
	
	@Override
	public List<BoardVo> getBoardListHit (int category) {
		List<BoardVo> result = boardDao.getBoardListHit(category);
		
		return result;
	}
	
	@Override
	public List<BookVo> getBookInfo (String search) {
		List<BookVo> bookList = null;
		bookList = boardDao.getBookInfo(search);
		
		return bookList;
	};

	@Override
	public BoardVo boardView(int serial) {
		BoardVo bvo = null;
		bvo = boardDao.boardSelect(serial);
		
		return bvo;
	}

	@Override
	public boolean boardWrite(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean boardModify(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean boardDelete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return false;
	}
}
