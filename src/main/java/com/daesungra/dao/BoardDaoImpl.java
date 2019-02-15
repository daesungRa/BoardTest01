package com.daesungra.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesungra.domain.BoardVo;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVo> selectTest () {
		List<BoardVo> list = sqlSession.selectList("board.selectTest");
		
		return list;
	}
}
