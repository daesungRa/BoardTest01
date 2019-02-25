package com.daesungra.service;

import java.util.List;

import com.daesungra.domain.MemberVo;

public interface MemberService01 {

	// login
	public MemberVo login (String userId, String userPwd);
	
	// select user info
	public MemberVo memberView (String userId);
	public MemberVo profileView (String userId);
	public List<MemberVo> memberList ();
	
	// join
	public boolean idChk (String userId);
	public boolean memberRegister (MemberVo vo);
	public boolean profileRegister (MemberVo vo);
	
	// update
	public boolean memberModify (MemberVo vo);
	
	// delete
	public boolean memberDelete (MemberVo vo);
}
