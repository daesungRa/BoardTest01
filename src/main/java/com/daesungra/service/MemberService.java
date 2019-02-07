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
		MemberDao dao = new MemberDao();
		vo = dao.memberSelect(userId, userPwd);
		
		return vo;
	}
	
	public String idCheck (String userId) {
		String result = "0";
		MemberDao dao = new MemberDao();
		if (dao.memberSelect(userId, "-1") != null) {
			result = "1";
		}
		
		return result;
	}
	
	public boolean memberRegister () {
		boolean result = false;
		
		return result;
	}
}
