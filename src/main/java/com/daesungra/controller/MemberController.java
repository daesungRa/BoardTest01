package com.daesungra.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daesungra.model.FileUpload;
import com.daesungra.model.MemberVo;
import com.daesungra.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Inject
	MemberService service;
	@Inject
	FileUpload fileUpload;
	
	/*
	 * login, logout
	 */
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String getLoginForm () {
		logger.info("call loginForm");
		
		return "/member/loginForm";
	}
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login (@RequestParam(value="userId") String userId, @RequestParam(value="userPwd") String userPwd, HttpServletRequest request) {
		String result = "";
		MemberVo vo = null;
		HttpSession session = request.getSession();
		logger.info("login 시작");
		vo = service.memberLogin(userId, userPwd);
		
		// 성공시 세션 세팅 후 인덱스로 이동, 실패시 실패 이유 알려주지 않음 (실패이유는 로그에 저장됨)
		if (vo != null) {
			session.setAttribute("userId", vo.getUserId());
			session.setAttribute("userName", vo.getUserName());
			session.setAttribute("msg", "로그인에 성공했습니다");
			logger.info("login 성공");
			
			result = "redirect:/";
		} else {
			session.setAttribute("msg", "로그인에 실패했습니다");
			logger.info("login 실패");
			result = "redirect:loginForm";
		}
		
		return result;
	}
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout (HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	/*
	 * join
	 */
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String getJoinForm (Model model) {
		logger.info("call joinForm");
		
		return "/member/joinForm";
	}
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join (HttpServletRequest request) {
		String result = "";
		boolean insertResult = false;
		HttpSession session = request.getSession();
		logger.info("join 시작");
		
		MemberVo vo = fileUpload.getMemberVo(request);
		
		if (vo != null) {
			logger.info("vo 생성완료");
			logger.info("oriFileName: " + vo.getPhotoOri() + ", sysFileName: " + vo.getPhoto());
			insertResult = service.memberRegister(vo);
			
			if (insertResult) {
				session.setAttribute("msg", "회원가입 완료");
				logger.info("join 성공");
				
				result = "redirect:loginForm";
			} else {
				session.setAttribute("msg", "회원가입에 실패했습니다");
				logger.info("join 실패");
				
				result = "redirect:joinForm";
			}
		} else {
			session.setAttribute("msg", "회원가입에 실패했습니다");
			logger.info("vo 생성실패");
		}
		
		return result;
	}
	// ViewResolver 를 거치지 않고 응답객체 자체를 반환
	@ResponseBody
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	public String idChk (@RequestParam(value="userId") String userId) {
		logger.info("[idChk] get user id: " + userId);
		String result = "0";
		result = service.idCheck(userId);
		
		return result;
	}
}