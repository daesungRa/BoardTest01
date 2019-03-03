package com.daesungra.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesungra.controller.BoardController;
import com.daesungra.domain.BoardVo;
import com.daesungra.domain.BookVo;
import com.daesungra.domain.MemberVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVo> getBoardListDate (int category) {
		List<BoardVo> listByDate = null;
		
		listByDate = sqlSession.selectList("board.boardListDate", category);
		
		return listByDate;
	}
	
	@Override
	public List<BoardVo> getBoardListHit (int category) {
		List<BoardVo> listByHit = null;
		
		listByHit = sqlSession.selectList("board.boardListHit", category);
		
		return listByHit;
	}
	
	@Override
	public List<BookVo> getBookInfo (String search) {
		List<BookVo> bookList = null;
		logger.info("[boardDao-searchBookInfo] 검색어 : " + search);
		
		bookList = sqlSession.selectList("board.selectBookInfo", search);
		
		return bookList;
	};

	@Override
	public BoardVo boardSelect(String serial) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean boardInsert(MemberVo vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean boardUpdate(MemberVo vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean boardDelete(String serial) {
		// TODO Auto-generated method stub
		return false;
	}
}
