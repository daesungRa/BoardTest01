package com.daesungra.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daesungra.controller.BoardController;
import com.daesungra.dao.BoardDao;
import com.daesungra.domain.BoardVo;
import com.daesungra.domain.BookVo;
import com.daesungra.domain.CommentVo;

@Service
public class BoardServiceImpl implements BoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardVo> getBoardList (Map<String, Object> pagenatedInputData) {
		List<BoardVo> result = boardDao.getBoardList(pagenatedInputData);
		
		return result;
	}
	
	@Override
	public List<BookVo> getBookInfo (String search) {
		List<BookVo> bookList = null;
		bookList = boardDao.getBookInfo(search);
		
		return bookList;
	};

	@Override
	public BoardVo boardView(BoardVo bvo) {
		BoardVo resultVo = null;
		resultVo = boardDao.boardSelect(bvo);
		
		return resultVo;
	}

	@Override
	public boolean boardWrite(BoardVo bvo) {
		logger.info("[service] call boardWrite action");
		boolean result = false;
		result = boardDao.boardInsert(bvo);
		
		return result;
	}

	@Override
	public boolean boardModify(BoardVo bvo) {
		boolean result = false;
		result = boardDao.boardUpdate(bvo);
		
		return result;
	}

	@Override
	public boolean boardRemove(BoardVo bvo) {
		boolean result = false;
		result = boardDao.boardDelete(bvo);
		
		return result;
	}
	
	@Override
	public List<CommentVo> getCommentList (int serial) {
		List<CommentVo> commentList = null;
		commentList = boardDao.getCommentList (serial);
		
		return commentList;
	}
	
	@Override
	public boolean commentWriteAction (CommentVo cvo) {
		boolean result = false;
		result = boardDao.commentInsert(cvo);
		
		return result;
	}
}
