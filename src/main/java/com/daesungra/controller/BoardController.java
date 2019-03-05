package com.daesungra.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daesungra.domain.BoardVo;
import com.daesungra.domain.BookVo;
import com.daesungra.domain.PageDto;
import com.daesungra.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private PageDto pageDto;

	// get board list
	/*
	 * 1. 페이징 처리 객체 생성 후 pagenation
	 * 2. 그 결과를 기반으로 매개변수 map 생성 (category, startNo, endNo)
	 * 3. map 을 매개변수로 받는 해당 카테고리 게시글 리스트 조회 (날짜순, 조회순)
	 * 4. request 객체에 페이지 객체, 날짜순 리스트, 조회순 리스트를 setAttribute 하고 반환
	 */
	@RequestMapping(value="/boardListPage/{category}/{nowPage}", method=RequestMethod.GET)
	public String getBoardListPage (HttpServletRequest request, @PathVariable int category, @PathVariable(name = "nowPage", required = false) int nowPage) {
		logger.info("call boardListPage category:" + category);
		
		int listSize = 5;
		int blockSize = 5;
		pageDto.setPageDto(listSize, blockSize, nowPage, category); // 페이징 처리를 위한 도메인 객체
		pageDto.pageCompute();
		
		Map<String, Object> pagenatedInputData = new HashMap<String, Object>();
		pagenatedInputData.put("category", category);
		pagenatedInputData.put("startNo", pageDto.getStartNo());
		pagenatedInputData.put("endNo", pageDto.getEndNo());
		
		List<BoardVo> listDate = boardService.getBoardListDate(pagenatedInputData); // 날짜별 정렬결과 리스트
		List<BoardVo> listHit = boardService.getBoardListHit(pagenatedInputData); // 조회수별 정렬결과 리스트
		logger.info("[getBoardList] 검색 리스트 길이(date, hit) / 현재 페이지 >>> " + listDate.size() + ", " + listHit.size() + " / " + nowPage);
		
		request.setAttribute("boardListDate", listDate);
		request.setAttribute("boardListHit", listHit);
		request.setAttribute("pageDto", pageDto);
		request.setAttribute("category", category);
		
		return "/board/boardListPage";
	}
	
	// search book info
	@ResponseBody // json 타입으로 반환하기 위함
	@RequestMapping(value="/searchBookInfo", method=RequestMethod.POST)
	public String searchBookInfo (HttpServletRequest request) {
		StringBuffer jsonResult = new StringBuffer();
		String search = request.getParameter("searchBookInfo");
		logger.info("search book info :" + request.getParameter("searchBookInfo"));
		
		List<BookVo> bookList = boardService.getBookInfo(search);
		if (bookList != null && bookList.size() > 0) { // 검색된 vo 객체만큼 json 타입 문자열 생성
			jsonResult.append("[" + bookList.get(0).toJson());
			for (int i = 1; i < bookList.size(); i++) {
				jsonResult.append(", " + bookList.get(i).toJson());
			}
			jsonResult.append("]");
		}
		
		logger.info("jsonResult : " + jsonResult.toString());
		return jsonResult.toString();
	}
	
	// get write page
	@RequestMapping(value="/boardWritePage/{category}", method=RequestMethod.GET)
	public String getBoardWritePage (HttpServletRequest request, @PathVariable int category) {
		logger.info("call boardWritePage category:" + category);
		request.setAttribute("category", category);
		
		return "/board/boardWritePage";
	}
	
	// write action
	@RequestMapping(value="/boardWriteAction", method=RequestMethod.POST)
	public String boardWriteAction (HttpServletRequest request, @ModelAttribute BoardVo bvo) {
		BoardVo resultVo = null;
		boolean result = false;
		logger.info("call board write action");
		
		bvo.setUserId((String) request.getSession().getAttribute("userId")); // 제출할 게시글 정보에 유저아이디 추가
		result = boardService.boardWrite(bvo); // 게시글 등록 (userId, bookNo, category, title, content)
		if (result) { // 등록 성공 시
			resultVo = boardService.boardView(bvo); // 방금 등록한 게시글 정보 조회
			if (resultVo != null) {
				request.setAttribute("boardVo", resultVo);
			}
		}
		request.setAttribute("category", request.getParameter("category"));
		
		return "/board/boardViewPage"; // 작성 후 해당 뷰 페이지로 이동
	}
	
	// view
	@RequestMapping(value="/boardViewPage/{serial}/{category}", method=RequestMethod.GET)
	public String getBoardViewPage (HttpServletRequest request, @PathVariable int serial, @PathVariable int category) {
		BoardVo resultVo = null;
		BoardVo insertVo = new BoardVo();
		logger.info("call boardViewPage serial, category : " + serial + ", " + category);
		
		insertVo.setSerial(serial);
		insertVo.setCategory(category);
		if (request.getSession().getAttribute("userId") != null) { // 접속정보가 있으면 아이디 세팅
			insertVo.setUserId((String) request.getSession().getAttribute("userId"));
		}
		
		resultVo = boardService.boardView(insertVo);
		if (resultVo != null) {
			request.setAttribute("boardVo", resultVo);
			request.setAttribute("category", resultVo.getCategory());
		} else {
			request.setAttribute("category", insertVo.getCategory());
		}
		
		return "/board/boardViewPage";
	}
	
	// modify
	@RequestMapping(value="/boardModifyAction", method=RequestMethod.POST)
	public String boardModifyAction (HttpServletRequest request, @ModelAttribute BoardVo bvo) {
		boolean result = false;
		BoardVo resultVo = null;
		logger.info("call board modify action");
		
		bvo.setUserId((String) request.getSession().getAttribute("userId"));
		result = boardService.boardModify(bvo);
		if (result) { // modify 성공 시
			resultVo = boardService.boardView(bvo); // 해당 게시글 조회 및 세팅
			request.setAttribute("boardVo", resultVo);
			request.setAttribute("category", resultVo.getCategory());
		} else { // modify 실패 시
			request.setAttribute("category", bvo.getCategory()); // 카테고리만 세팅
		}
		
		return "/board/boardViewPage"; // 수정 후 해당 뷰 페이지로 이동
	}
	
	// remove
	@ResponseBody
	@RequestMapping(value="/boardRemoveAction", method=RequestMethod.GET)
	public String boardRemoveAction (HttpServletRequest request, @ModelAttribute BoardVo bvo) {
		String result = "0";
		bvo.setUserId((String) request.getSession().getAttribute("userId"));
		logger.info("call remove action");
		logger.info("[remove] 요청 serial, userId : " + bvo.getSerial() + ", " + bvo.getUserId());
		
		boolean deleteResult = boardService.boardRemove(bvo);
		if (deleteResult) {
			result = "1";
			logger.info("[boare remove] 게시글 삭제 성공");
		}
		
		return result;
	}
}
