package com.daesungra.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daesungra.component.GetHashedData;
import com.daesungra.controller.MemberController;
import com.daesungra.dao.MemberDao;
import com.daesungra.domain.MemberSaltVo;
import com.daesungra.domain.MemberVo;

@Service
public class MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private MemberDao dao;
	@Autowired
	private SqlSession sqlSession;

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
		vo = dao.profileSelect(userId);
		
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
		// MemberDao dao = new MemberDao();
		logger.info("[MemberService] register 시작");
		
		/*
		 * 비밀번호 암호화 처리
		 */
		// 소금코드 생성 후
		// 소금 + 비밀번호 결과를 해싱
		String saltData = GetHashedData.generateRandomString();
		String userPwd = GetHashedData.generateHashedString(saltData + vo.getUserPwd());
		logger.info("비밀번호 해싱 결과 (saltData, userPwd) : " + saltData + ", " + userPwd);
		
		// 해싱 결과가 있다면 vo 에 생성된 비밀번호 해시코드 세팅
		if (userPwd != null && !userPwd.equals("")) {
			vo.setUserPwd(userPwd);
		}
		
		// dmember 에 저장
		result = dao.memberInsert(vo);

		// 회원등록 성공 시 소금코드 db 에 저장
		if (result && userPwd != null && !userPwd.equals("")) {
			// salt vo 객체 생성
			MemberSaltVo svo = new MemberSaltVo();
			svo.setUserId(vo.getUserId());
			svo.setSaltData(saltData);
			
			// insert 실행
			int r = sqlSession.insert("member.saltInsert", svo);
			
			/*if (r > 0) { // saltInsert 성공 시 커밋
				sqlSession.commit();
			} else {
				sqlSession.rollback();
			}*/  // sqlSessionTemplate 사용 시, 프로그램 단위에서 트랜잭션 제어는 불가능함!!
			// 일단은 걍 믿고 쓸것
			// 추후 프로그램 단위에서 트랜잭션 제어하는 방법을 찾아볼 것
		}
		
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
