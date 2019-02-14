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
		List<BoardVo> list = null;
		
		return list;
	}
}
