package com.daesungra.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.daesungra.domain.BoardReportVo;
import com.daesungra.service.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="/getBoardReportList", method=RequestMethod.GET)
	public ModelAndView getBoardReportList (HttpServletRequest request) {
		logger.info("[boardreport list - admin controller] 게시글 신고 목록 요청");
		List<BoardReportVo> brvoList = null; // 검색할 신고 리스트
		ModelAndView mav = new ModelAndView(); // 반환할 mav
		mav.setViewName("/admin/adminReportListPart"); // 리턴 경로
		BoardReportVo brvo = new BoardReportVo(); // 매개변수 객체
		if (request.getParameter("rDate") != null && !request.getParameter("rDate").equals("")) {
			brvo.setrDate(request.getParameter("rDate")); // 요청에 신고글 등록일 파라미터가 존재한다면 매개변수 객체에 세팅
		} else {
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYMMdd"); // 쿼리 조건절에 투입될 신고글 등록일 포맷
			Date date = new Date(); // today
			brvo.setrDate(dateFormat.format(date)); // 요청 파라미터가 없다면 오늘 날짜로 세팅
		}
		
		// 신고글 리스트를 구해서 mav 로 반환
		logger.info("[boardreport list - admin controller] 요청 날짜 : " + brvo.getrDate());
		brvoList = adminService.getBoardReportList(brvo);
		if (brvoList != null) {
			logger.info("[boardreport list - admin controller] 신고 리스트 조회 완료");
			// request.setAttribute("boardReportList", brvoList);
			mav.addObject("boardReportList", brvoList);
		}
		
		return mav;
	}
}
