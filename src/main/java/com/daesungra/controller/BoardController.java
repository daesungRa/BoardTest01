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
	
	// 게시글 리스트 조회 및 페이징 처리를 위한 변수
	private int listSize = 5;
	private int blockSize = 5;
	private int nowPage = 1;
	
	private int searchBySort = 1; // 1: 최신순, 2: 오래된순, 3: 조회순, 4: 추천순
	private int searchByContent = 1; // 1: 제목 + 내용, 2: 제목만, 3: 내용만, 4: 작가별
	private String searchContent = ""; // 검색어

	/*
	 * 1. 페이징 처리 객체 생성 후 pagenation
	 * 2. 그 결과를 기반으로 매개변수 map 생성 (category, startNo, endNo)
	 * 3. map 을 매개변수로 받는 해당 카테고리 게시글 리스트 조회 (날짜순, 조회순)
	 * 4. request 객체에 페이지 객체, 날짜순 리스트, 조회순 리스트를 setAttribute 하고 반환
	 */
	// get board list
	// 카테고리별 전체검색 (날짜별, 조회별, get 방식)
	@RequestMapping(value="/boardListPage/{category}/{nowPage}", method=RequestMethod.GET)
	public String getBoardListPage (HttpServletRequest request, @PathVariable int category, @PathVariable(name = "nowPage", required = false) int nowPage) {
		logger.info("call boardListPage category : " + category);
		
		if (nowPage < 1) {
			nowPage = 1;
		}
		pageDto.setPageDto(this.listSize, this.blockSize, nowPage, category); // 페이징 처리를 위한 도메인 객체
		pageDto.pageCompute();
		
		Map<String, Object> pagenatedInputData = new HashMap<String, Object>(); // 페이징 결과값을 포함한 db input data
		pagenatedInputData.put("category", category);
		pagenatedInputData.put("startNo", pageDto.getStartNo());
		pagenatedInputData.put("endNo", pageDto.getEndNo());
		pagenatedInputData.put("searchBySort", 1);
		
		List<BoardVo> listDate = boardService.getBoardList(pagenatedInputData); // 날짜별 정렬결과 리스트
		
		pagenatedInputData.put("searchBySort", 3);
		List<BoardVo> listHit = boardService.getBoardList(pagenatedInputData); // 조회수별 정렬결과 리스트
		logger.info("[getBoardList] 검색 리스트 길이(date, hit) / 현재 페이지 >>> " + listDate.size() + ", " + listHit.size() + " / " + nowPage);
		
		request.setAttribute("boardListDate", listDate);
		request.setAttribute("boardListHit", listHit);
		request.setAttribute("pageDto", pageDto);
		request.setAttribute("category", category);
		
		return "/board/boardListPage";
	}
	
	// get board list including search content (검색 폼으로 검색시, ajax, post 방식)
	@RequestMapping(value="/boardListSearch", method=RequestMethod.POST)
	public String getBoardListWithSearch (HttpServletRequest request) {
		// form 전송내용 >> searchBySort, searchByContent, searchContent, category, nowPage
		this.searchBySort = Integer.parseInt(request.getParameter("searchBySort")); // 1: 최신순, 2: 오래된순, 3: 조회순, 4: 추천순
		this.searchByContent = Integer.parseInt(request.getParameter("searchByContent")); // 1: 제목 + 내용, 2: 제목만, 3: 내용만, 4: 작가별
		this.searchContent = request.getParameter("searchContent");
		int category = Integer.parseInt(request.getParameter("category"));
		this.nowPage = Integer.parseInt(request.getParameter("nowPage"));
		logger.info("[search board list]");
		logger.info("searchBySort, searchByContent, searchContent, category, nowPage : "
				+ searchBySort + ", " + searchByContent + ", " + searchContent + ", " + category + ", " + nowPage);
		
		int listSize = 5;
		int blockSize = 5;
		pageDto.setPageDtoSearch(listSize, blockSize, nowPage, category, searchContent, searchByContent);
		pageDto.pageCompute();
		
		Map<String, Object> searchInputData = new HashMap<String, Object>();
		searchInputData.put("searchBySort", searchBySort);
		searchInputData.put("searchByContent", searchByContent);
		searchInputData.put("searchContent", searchContent);
		searchInputData.put("category", category);
		searchInputData.put("startNo", pageDto.getStartNo());
		searchInputData.put("endNo", pageDto.getEndNo());
		
		List<BoardVo> list = boardService.getBoardList(searchInputData); // 정렬결과 리스트
		logger.info("[getBoardList] 검색 리스트 길이 : " + list.size());
		
		request.setAttribute("boardList", list);
		request.setAttribute("pageDto", pageDto);
		request.setAttribute("category", category);
		request.setAttribute("searchInputData", searchInputData);
		
		return "/board/boardListViewPart";
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
	
	/*
	 * board write
	 */
	// get write page
	@RequestMapping(value="/boardWritePage/{category}", method=RequestMethod.GET)
	public String getBoardWritePage (HttpServletRequest request, @PathVariable int category) {
		logger.info("call boardWritePage category:" + category);
		request.setAttribute("category", category);
		
		return "/board/boardWritePage";
	}
	
	// write action
	@ResponseBody
	@RequestMapping(value="/boardWriteAction", method=RequestMethod.POST)
	public String boardWriteAction (HttpServletRequest request, @ModelAttribute BoardVo bvo) {
		String resultStr = "0";
		boolean result = false;
		logger.info("call board write action");
		
		bvo.setUserId((String) request.getSession().getAttribute("userId")); // 제출할 게시글 정보에 유저아이디 추가
		result = boardService.boardWrite(bvo); // 게시글 등록 (userId, bookNo, category, title, content)
		if (result) { // 등록 성공 시
			resultStr = "1";
		}
		request.setAttribute("category", request.getParameter("category"));
		
		return resultStr; // 작성 후 해당 뷰 페이지로 이동
	}
	
	/*
	 * board view
	 */
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
	
	/*
	 * board modify
	 */
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
	
	/*
	 * board remove
	 */
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
