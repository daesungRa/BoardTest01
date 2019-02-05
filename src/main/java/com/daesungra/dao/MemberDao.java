package com.daesungra.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.daesungra.model.DBConn;
import com.daesungra.model.MemberVo;

public class MemberDao {
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	/*
	 * 커넥션 관련 자원 반납
	 */
	public void closeSet () {
		try {
			if (rs != null) rs.close();
			if (ps != null) ps.close();
			if (conn != null) conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	/*
	 * - memberSelect
	 * 로그인, 회원조회에 사용됨 (login, memberView)
	 * 패스워드는 받아오지 않음 (별도 로직)
	 */
	public MemberVo memberSelect (String userId, String userPwd) {
		MemberVo vo = null;
		this.conn = new DBConn().getConn();
		
		try {
			String sql = " select * from member where userId = ? and userPwd = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, userPwd);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				vo = new MemberVo();
				vo.setUserId(rs.getString("userId"));
				vo.setUserName(rs.getString("userName"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone(rs.getString("phone"));
				vo.setPostal(rs.getString("postal"));
				vo.setAddress(rs.getString("address"));
				if (rs.getString("photo") != null) {
					vo.setPhoto(rs.getString("photo"));
					vo.setPhotoOri(rs.getString("photoOri"));
				}
				vo.setmDate(rs.getString("mDate"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}
		
		return vo;
	}
	
	/*
	 * - memberList
	 * 회원 리스트 조회에 사용됨 (memberList)
	 * 아이디, 이름, 이메일, 등록일 받아옴
	 */
	public List<MemberVo> memberList () {
		List<MemberVo> memberList = new ArrayList<MemberVo>();
		
		return memberList;
	}
	
	/*
	 * - memberInsert
	 * 회원가입에 사용됨 (register)
	 */
	public boolean memberInsert (MemberVo vo) {
		boolean result = false;
		
		return result;
	}
	
	/*
	 * - memberUpdate
	 * 회원정보 수정에 사용된 (memberModify)
	 */
	public boolean memberUpdate (MemberVo vo) {
		boolean result = false;
		
		return result;
	}
	
	/*
	 * - memberDelete
	 * 회원탈퇴에 사용됨 (memberLeave)
	 */
	public boolean memberDelete (String userId, String userPwd) {
		boolean result = false;
		
		return result;
	}
}
