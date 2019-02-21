package com.daesungra.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.daesungra.component.DBConn;
import com.daesungra.domain.MemberVo;

public class MemberDao {
	
	/*
	 * 커넥션은 매 메서드 실행 시마다 새로 만들었다가 해제함
	 * dao 를 호출하는 service 객체가 controller 에서 항시 객체로 주입되기 때문(?)
	 * 	- 그렇다면 controller 는 항시 운용중이고, service 객체는 항시 살아있다는 의미일까??
	 */
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);
	
	@Autowired
	private DBConn dbConn;
	
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
	 * 만약 입력된 패스워드가 '-1' 이라면, 단순 아이디 조회임
	 */
	public MemberVo memberSelect (String userId, String userPwd) {
		MemberVo vo = null;
		String sql = null;
		/*this.conn = dbConn.getConn();*/
		this.conn = new DBConn().getConn();
		if (this.conn != null) {
			logger.info("this.conn != null");
		} else {
			logger.info("this.conn == null");
		}
		
		
		try {
			// pwd 가 -1 이라면 아이디체크, 아니라면 로그인 및 회원조회
			if (userPwd.equals("-1")) {
				sql = " select * from dmember where userId = ? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, userId);
			} else {
				sql = " select * from dmember where userId = ? and userPwd = ? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, userId);
				ps.setString(2, userPwd);
			}
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				vo = new MemberVo();
				vo.setUserId(rs.getString("userId"));
				vo.setUserName(rs.getString("userName"));
				vo.setEmail(rs.getString("email"));
				vo.setPhone(rs.getString("phone"));
				if (rs.getString("postal") != null) {
					vo.setPostal(rs.getString("postal"));
					vo.setAddress(rs.getString("address"));
				}
				if (rs.getString("addressAdd") != null) {
					vo.setAddressAdd(rs.getString("addressAdd"));
				}
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
	 * - profileSelect
	 * 프로필 조회
	 */
	public MemberVo profileSelect (String userId) {
		MemberVo vo = null;
		String sql = null;
		this.conn = new DBConn().getConn();
		
		try {
			sql = " select m.userId userId, m.userName userName, m.photo photo, m.photoOri photoOri, p.introduce introduce, p.interest interest, p.isPublic isPublic "
					+ "	from dmember m join dmember_profile p "
					+ "	on m.userId = p.userId "
					+ "	where p.userId = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			
			while (rs.next()) {
				vo = new MemberVo();
				vo.setUserId(rs.getString("userId"));
				vo.setUserName(rs.getString("userName"));
				if (rs.getString("photo") != null) {
					vo.setPhoto(rs.getString("photo"));
					vo.setPhotoOri(rs.getString("photoOri"));
				}
				vo.setIntroduce(rs.getString("introduce"));
				vo.setInterest(rs.getString("interest"));
				vo.setIsPublic(rs.getString("isPublic"));
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
		String sql = null;
		this.conn = new DBConn().getConn();
		
		try {
			conn.setAutoCommit(false);
			sql = " insert into dmember (userId, userPwd, userName, email, phone, postal, address, photo, photoOri, mDate, addressAdd, isDelete) "
				    + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?, 0) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getUserId());
			ps.setString(2, vo.getUserPwd());
			ps.setString(3, vo.getUserName());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getPhone());
			
			if (vo.getPostal() == null) { // 입력된 주소정보가 없다면 공백 투입
				ps.setString(6, "");
				ps.setString(7, "");
				ps.setString(10, "");
			} else if (vo.getAddressAdd() != null) {
				ps.setString(6, vo.getPostal());
				ps.setString(7, vo.getAddress());
				ps.setString(10, vo.getAddressAdd());
			} else {
				ps.setString(6, vo.getPostal());
				ps.setString(7, vo.getAddress());
				ps.setString(10, "");
			}
			
			if (vo.getPostal() == null) { // 입력된 파일정보가 없다면 공백 투입
				ps.setString(8, "");
				ps.setString(9, "");
			} else {				
				ps.setString(8, vo.getPhoto());
				ps.setString(9, vo.getPhotoOri());
			}
			
			int insertResult = ps.executeUpdate();
			
			if (insertResult > 0) {
				conn.commit();
				result = true;
			}
		} catch (Exception ex) {
			try {
				conn.rollback();
			} catch (Exception ex2) { ex2.printStackTrace(); }
			ex.printStackTrace();
		} finally {
			try {
				closeSet();
			} catch (Exception ex) { }
		}
		
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
