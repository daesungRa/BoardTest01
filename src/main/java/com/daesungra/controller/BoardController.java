package com.daesungra.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.daesungra.domain.BoardVo;
import com.daesungra.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// get board list
	@RequestMapping(value="/boardListPage/{category}", method=RequestMethod.GET)
	public String getBoardList (HttpServletRequest request, @PathVariable int category) {
		logger.info("call boardListPage category:" + category);
		
		List<BoardVo> listDate = boardService.getBoardListDate(category); // 날짜별 정렬결과 리스트
		List<BoardVo> listHit = boardService.getBoardListHit(category); // 조회수별 정렬결과 리스트
		logger.info("[getBoardList] 검색 리스트 길이 : " + listDate.size() + ", " + listHit.size());
		request.setAttribute("boardListDate", listDate);
		request.setAttribute("boardListHit", listHit);
		
		return "/board/boardListPage";
	}
	
	// write
	// view
	// modify
	// remove
}
