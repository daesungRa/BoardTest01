package com.daesungra.dao;

import java.util.List;

import com.daesungra.domain.MemberVo;

public interface MemberDao {
	
	// login
	public MemberVo login (String userId, String userPwd);
	
	// select user info
	public MemberVo memberSelect (String userId);
	public MemberVo profileSelect (String userId);
	public List<MemberVo> memberList ();
	
	// join
	public boolean idChk (String userId);
	public boolean memberInsert (MemberVo vo);
	public boolean profileInsert (MemberVo vo);
	
	// update
	public boolean memberUpdate (MemberVo vo);
	
	// delete
	public boolean memberDelete (String userId, String userPwd);

}
