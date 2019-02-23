package com.daesungra.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daesungra.component.FileUpload;
import com.daesungra.domain.MemberVo;
import com.daesungra.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	MemberService service;
	@Autowired
	FileUpload fileUpload;
	
	/*
	 * login, logout
	 */
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String getLoginForm () {
		logger.info("call loginForm");
		
		return "/member/loginForm";
	}
	@ResponseBody // ViewResolver 를 거치지 않고 응답객체 자체를 반환. (json 에 주로 활용됨)
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
			logger.info("login 성공");
			
			result = "1"; // 성공 플래그
		} else {
			logger.info("login 실패");
			
			result = "0"; // 실패 플래그
		}
		
		return result;
	}
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout (HttpSession session) {
		session.invalidate();
		
		return "redirect:/"; // 로그아웃 후 메인으로 보냄
	}
	// 해야함
	@RequestMapping(value="/findIdForm", method=RequestMethod.POST)
	public String getfindIdForm () {
		logger.info("call findIdForm");
		
		return "/member/findIdForm";
	}
	@RequestMapping(value="/findPwdForm", method=RequestMethod.POST)
	public String getfindPwdForm () {
		logger.info("call findPwdForm");
		
		return "/member/findPwdForm";
	}
	
	/*
	 * join
	 */
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String getJoinForm (Model model) {
		logger.info("call joinForm");
		
		return "/member/joinForm";
	}
	@ResponseBody // ViewResolver 를 거치지 않고 응답객체 자체를 반환. (json 에 주로 활용됨)
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join (HttpServletRequest request) {
		String result = "0";
		boolean insertResult = false;
		logger.info("join 시작");
		
		if (fileUpload == null) {
			logger.info("fileupload object is null");
		}
		
		// 파일 업로드 수행
		// vo 객체가 반환된다
		MemberVo vo = fileUpload.getMemberVo(request);
		
		if (vo != null) {
			logger.info("vo 생성완료");
			logger.info("oriFileName: " + vo.getPhotoOri() + ", sysFileName: " + vo.getPhoto());
			insertResult = service.memberRegister(vo);
			
			if (insertResult) {
				logger.info("join 성공");
				result = "1";
			} else {
				logger.info("join 실패");
				result = "0";
			}
		} else {
			logger.info("vo 생성실패");
			result = "0";
		}
		
		return result;
	}
	@ResponseBody // ViewResolver 를 거치지 않고 응답객체 자체를 반환. (json 에 주로 활용됨)
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	public String idChk (@RequestParam(value="userId") String userId) {
		logger.info("[idChk] get user id: " + userId);
		String result = "0";
		result = service.idCheck(userId);
		
		return result;
	}
	
	/*
	 * 회원관리
	 */
	// profile 해야함
	@RequestMapping(value={"/memberProfileForm", "/memberInfoForm"}, method=RequestMethod.GET)
	public String getMemberInfo (HttpServletRequest request) {
		String result = "";
		String requestUri = request.getRequestURI();
		String requestPage = requestUri.substring(requestUri.lastIndexOf("/") + 1, requestUri.length());
		MemberVo vo = new MemberVo(); // 공갈 페이지라도 넘어가서 페이지 그림
		
		// 인터셉터 통과했다면, 세션에 저장된 아이디로 회원정보를 검색해 뷰에 반환한다
		if (requestPage.equals("memberProfileForm")) {
			logger.info("call " + requestPage + " page");
			// profile
			// 응답 flag 가 0 이면 세션정보 없음, 1 이면 조회결과 없음, 2 면 조회성공
			if (request.getSession().getAttribute("userId") != null) { // 로그인 정보가 있다면 vo 초기화
				vo = service.profileView((String)request.getSession().getAttribute("userId"));
				if (vo == null) {
					request.setAttribute("flag", "1");
				} else {
					request.setAttribute("flag", "2");
				}
			} else {
				request.setAttribute("flag", "0");
			}
			
			request.setAttribute("memberVo", vo);
			result = "/member/memberProfileForm";
		} else if (requestPage.equals("memberInfoForm")) {
			logger.info("call " + requestPage + " page");
			// info
			// 응답 flag 가 0 이면 세션정보 없음, 1 이면 조회결과 없음, 2 면 조회성공
			if (request.getSession().getAttribute("userId") != null) { // 로그인 정보가 있다면 vo 초기화
				vo = service.memberView((String)request.getSession().getAttribute("userId"));
				if (vo == null) {
					request.setAttribute("flag", "1");
				} else {
					request.setAttribute("flag", "2");
				}
			} else {
				request.setAttribute("flag", "0");
			}
			
			request.setAttribute("memberVo", vo);
			result = "/member/memberInfoForm";
		} 
		
		return result;
	}
	// 해야함
	@ResponseBody // ViewResolver 를 거치지 않고 응답객체 자체를 반환. (json 에 주로 활용됨)
	@RequestMapping(value="/memberModify", method=RequestMethod.POST)
	public String memberModify (HttpServletRequest request) {
		String result = "0";
		logger.info("modify 시작");
		
		return result;
	}
	@ResponseBody // ViewResolver 를 거치지 않고 응답객체 자체를 반환. (json 에 주로 활용됨)
	@RequestMapping(value="/memberLeave", method=RequestMethod.POST)
	public String memberLeave (HttpServletRequest request) {
		String result = "0";
		logger.info("memberLeave 시작");
		
		return result;
	}
}