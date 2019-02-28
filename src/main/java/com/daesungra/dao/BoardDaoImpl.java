package com.daesungra.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesungra.domain.BoardVo;
import com.daesungra.domain.MemberVo;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVo> getBoardList (int category) {
		List<BoardVo> list = null;
		list = sqlSession.selectList("board.boardList", category);
		
		return list;
	}

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
