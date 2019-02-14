package com.daesungra.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daesungra.domain.BoardVo;
import com.daesungra.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value="/categoryFour", method=RequestMethod.GET)
	public String getBoardPage (HttpServletRequest request) {
		logger.info("call boardPage");
		
		List<BoardVo> list = sqlSession.selectList("board.selectTest"); // boardService.selectTest();
		request.setAttribute("boardList", list);
		
		return "/board/boardPage";
	}
}
