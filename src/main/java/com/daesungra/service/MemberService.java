package com.daesungra.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.daesungra.domain.MemberVo;

public interface MemberService {

	// login
	public MemberVo login (String userId, String userPwd); // ok
	
	// select user info
	public MemberVo memberView (String userId); // ok
	public MemberVo profileView (String userId);
	public List<MemberVo> memberList (); // ok
	
	// join
	public boolean idCheck (String userId); // ok
	public boolean memberRegister (MemberVo vo); // ok
	public boolean profileRegister (HttpServletRequest request);
	
	// update
	public boolean memberModify (MemberVo vo); // ok
	
	// delete
	public boolean memberDelete (HttpServletRequest request); // ok
}
