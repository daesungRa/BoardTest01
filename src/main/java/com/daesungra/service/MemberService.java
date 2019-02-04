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
	public MemberVo memberLogin (String userId, String userPwd) {
		MemberVo vo = null;
		MemberDao memberDao = new MemberDao();
		vo = memberDao.memberSelect(userId, userPwd);
		
		return vo;
	}
	
	public boolean memberRegister () {
		boolean result = false;
		
		return result;
	}
}
