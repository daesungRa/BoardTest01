package com.daesungra.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daesungra.dao.BoardDao;
import com.daesungra.domain.BoardVo;

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
	public BoardVo boardView(String serial) {
		// TODO Auto-generated method stub
		return null;
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
