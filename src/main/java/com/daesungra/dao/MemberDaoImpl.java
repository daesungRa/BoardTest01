package com.daesungra.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesungra.component.DBConn;
import com.daesungra.component.GetHashedData;
import com.daesungra.controller.MemberController;
import com.daesungra.domain.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	/*
	 * 커넥션은 매 메서드 실행 시마다 새로 만들었다가 해제함
	 * dao 를 호출하는 service 객체가 controller 에서 항시 객체로 주입되기 때문(?)
	 * 	- 그렇다면 controller 는 항시 운용중이고, service 객체는 항시 살아있다는 의미일까??
	 */
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
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
	
	// - login -
	// 입력받은 아이디, 해싱된 비밀번호로 로그인
	public MemberVo login (String userId, String userPwd) {
		MemberVo vo = null; // 반환할 vo
		String saltData = "";
		String hashedPwd = "";
		
		saltData = sqlSession.selectOne("member.selectSalt", userId); // 아이디에 해당하는 소금값 가져오기
		hashedPwd = GetHashedData.generateHashedString(saltData + userPwd); // 입력받은 비밀번호에 소금치기
		logger.info("[login] 비밀번호 해싱 결과 (saltData, hashedPwd) : " + saltData + ", " + hashedPwd);
		
		MemberVo insertVo = new MemberVo(); // 쿼리에 투입할 임시 vo 객체 생성
		insertVo.setUserId(userId);
		insertVo.setUserPwd(hashedPwd); // 해싱된 비번 투입
		vo = sqlSession.selectOne("member.selectMemberLogin", insertVo); // 로그인 정보 얻어오기
		
		return vo;
	}
	
	// - memberSelect -
	// 회원정보 조회
	public MemberVo memberSelect (String userId) {
		MemberVo vo = null;
		String sql = null;
		
		return vo;
	}
	
	/*
	 * - profileSelect
	 * 프로필 조회
	 */
	public MemberVo profileSelect (String userId) {
		MemberVo vo = null;
		String sql = null;
		/*this.conn = new DBConn().getConn();
		
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
		}*/
		
		return vo;
	}
	
	// - memberList -
	// 회원 리스트 조회에 사용됨 (memberList)
	// 아이디, 이름, 이메일, 등록일 받아옴
	public List<MemberVo> memberList () {
		List<MemberVo> memberList = new ArrayList<MemberVo>();
		
		return memberList;
	}
	
	// - idChk -
	// 회원가입 시 아이디 중복확인
	public boolean idChk (String userId) {
		boolean result = false;
		String checkResult = "";
		
		checkResult = sqlSession.selectOne("member.idChk", userId); // 검색결과가 없다면 null 이 들어감!!
		
		if (checkResult != null && !checkResult.equals("")) {
			result = true;
		}
		
		return result;
	}
	
	// - memberInsert -
	// 회원가입에 사용됨 (register)
	public boolean memberInsert (MemberVo vo) {
		boolean result = false;
		int r = sqlSession.insert("member.memberInsert", vo);
		
		if (r > 0) {
			result = true;
			// sqlSession.commit(); // sqlSessionTemplate 사용 시, 프로그램 단위에서 트랜잭션 제어는 불가능함!!
			// 일단은 걍 믿고 쓸것
			// 추후 프로그램 단위에서 트랜잭션 제어하는 방법을 찾아볼 것
		}
		
		return result;
	}
	
	public boolean profileInsert (MemberVo vo) {
		boolean result = false;
		
		return result;
	}
	

	// - memberUpdate -
	// 회원정보 수정에 사용된 (memberModify)
	public boolean memberUpdate (MemberVo vo) {
		boolean result = false;
		
		return result;
	}
	

	// - memberDelete -
	// 회원탈퇴에 사용됨 (memberLeave)
	public boolean memberDelete (String userId, String userPwd) {
		boolean result = false;
		
		return result;
	}
}
