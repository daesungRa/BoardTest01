package com.daesungra.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daesungra.dao.BoardDao;
import com.daesungra.domain.BoardVo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	public List<BoardVo> selectTest () {
		List<BoardVo> list = boardDao.selectTest();
		
		return list;
	}

	@Override
	public BoardVo view() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean write() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modify() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete() {
		// TODO Auto-generated method stub
		return false;
	}
}
