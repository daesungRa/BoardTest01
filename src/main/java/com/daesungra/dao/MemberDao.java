package com.daesungra.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.daesungra.domain.MemberVo;

public interface MemberDao {
	
	// login
	public MemberVo login (String userId, String userPwd);
	
	// select user info
	public MemberVo memberSelect (String userId);
	public MemberVo profileSelect (String userId);
	public List<MemberVo> memberList ();
	
	// join
	public boolean idCheck (String userId);
	public boolean memberInsert (MemberVo vo);
	
	// update
	public boolean memberUpdate (MemberVo vo);
	public boolean profileUpdate (HttpServletRequest request);
	
	// delete
	public boolean memberDelete (HttpServletRequest request);
	// public boolean memberDeleteConfirm (); // 보류

}
