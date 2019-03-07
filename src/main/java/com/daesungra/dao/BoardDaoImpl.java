package com.daesungra.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesungra.controller.BoardController;
import com.daesungra.domain.BoardVo;
import com.daesungra.domain.BookVo;
import com.daesungra.domain.CommentVo;

@Repository
public class BoardDaoImpl implements BoardDao {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardVo> getBoardList (Map<String, Object> pagenatedInputData) {
		List<BoardVo> listByDate = null;
		
		listByDate = sqlSession.selectList("board.getBoardList", pagenatedInputData);
		
		return listByDate;
	};
	
	@Override
	public List<BookVo> getBookInfo (String search) {
		List<BookVo> bookList = null;
		logger.info("[boardDao-searchBookInfo] 검색어 : " + search);
		
		bookList = sqlSession.selectList("board.selectBookInfo", search);
		
		return bookList;
	};

	@Override
	public BoardVo boardSelect(BoardVo bvo) {
		BoardVo resultVo = null;
		
		resultVo = sqlSession.selectOne("board.selectBoardInfo", bvo);
		if (resultVo != null) { // 조회 결과가 있을 경우
			sqlSession.update("board.boardHitIncrement", bvo); // 현재 조회된 글의 조회수 1 증가
		}		
		
		return resultVo;
	};

	@Override
	public boolean boardInsert(BoardVo bvo) {
		logger.info("[dao] call board insert action");
		boolean result = false;
		int insertResult = sqlSession.insert("board.insertBoardInfo", bvo);
		if (insertResult > 0) { // 글쓰기 성공시
			result = true;
		}
		
		return result;
	};

	@Override
	public boolean boardUpdate(BoardVo bvo) {
		boolean result = false;
		int updateResult = sqlSession.update("board.boardUpdate", bvo);
		if (updateResult > 0) {
			result = true;
		}
		
		return result;
	};

	@Override
	public boolean boardDelete(BoardVo bvo) {
		boolean result = false;
		logger.info("[boardDao-delete] 요청 serial, userId : " + bvo.getSerial() + ", " + bvo.getUserId());
		
		// set isDelete = 1
		int resultQuery = sqlSession.update("board.boardDelete", bvo);
		if (resultQuery > 0) {
			result = true;
		}
		
		return result;
	};
	
	@Override
	public List<CommentVo> getCommentList (int serial) {
		List<CommentVo> commentList = null;
		commentList = sqlSession.selectList("comment.getCommentList", serial);
		
		return commentList;
	}
	
	@Override
	public boolean commentInsert (CommentVo cvo) {
		boolean result = false;
		int insertResult = sqlSession.insert("comment.commentInsert", cvo);
		if (insertResult > 0) {
			logger.info("[comment write dao] 성공!");
			result = true;
		}
		
		return result;
	}
}
