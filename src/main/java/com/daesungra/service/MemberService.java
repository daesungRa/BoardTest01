package com.daesungra.service;

import org.springframework.stereotype.Service;

import com.daesungra.dao.MemberDao;
import com.daesungra.model.MemberVo;

@Service
public class MemberService {

	public int test () {
		return 0;
	}
	
	// 로그인 성공하면 vo 그대로 반환, 실패면 null 반환
	// vo 를 반환하는 이유는, 로그인 성공 시 세션 세팅을 위해서
	public MemberVo memberLogin (String userId, String userPwd) {
		MemberVo vo = null;
		MemberDao dao = new MemberDao();
		vo = dao.memberSelect(userId, userPwd);
		
		return vo;
	}
	
	// 로그인 성공하면 vo 그대로 반환, 실패면 null 반환
	public MemberVo memberView (String userId) {
		MemberVo vo = null;
		MemberDao dao = new MemberDao();
		vo = dao.memberSelect(userId, "-1");
		
		return vo;
	}
	
	// 등록된 프로필 조회
	public MemberVo profileView (String userId) {
		MemberVo vo = null;
		MemberDao dao = new MemberDao();
		vo = dao.memberSelect(userId, "-1");
		
		return vo;
	}
	
	// result 1 이면 중복 아이디가 존재하는 것, 0 이면 없는 것
	// 컨트롤러에서 ResponseBody 로 결과 그대로 전송하기 위함(boolean 은 불가)
	public String idCheck (String userId) {
		String result = "0";
		MemberDao dao = new MemberDao();
		if (dao.memberSelect(userId, "-1") != null) {
			result = "1";
		}
		
		return result;
	}
	
	// 파일 업로드 결과정보까지 포함된 vo 객체를 받아서 dao 로 db 에 투입함
	public boolean memberRegister (MemberVo vo) {
		boolean result = false;
		MemberDao dao = new MemberDao();
		result = dao.memberInsert(vo);
		
		return result;
	}
	
	// 프로필 등록 / 수정 (비공개는 isPublic = '0')
	// 회원정보 삭제 시 cascade
	public boolean profileRegister (MemberVo vo) {
		boolean result = false;
		MemberDao dao = new MemberDao();
		
		return result;
	}
	
	// 회원정보 수정
	public boolean memberModify () {
		boolean result = false;
		
		return result;
	}
	
	// 회원정보 삭제
	// 게시글이 존재하면 실패할 수 있음
	public boolean memberDelete () {
		boolean result = false;
		
		return result;
	}
}
