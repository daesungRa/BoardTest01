package com.daesungra.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesungra.controller.EmailController;
import com.daesungra.domain.MemberVo;

@Repository
public class EmailDaoImpl implements EmailDao {
	
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	@Autowired
	private SqlSession sqlSession;

	@Override
	public String selectUserId(MemberVo mbvo) {
		String result = "";
		logger.info("[email dao] call find id");
		logger.info("[email dao] 요청정보 / 이름, 이메일 : " + mbvo.getUserName() + ", " + mbvo.getEmail());
		
		result = sqlSession.selectOne("email.findId", mbvo);
		if (result != null && !result.equals("")) {
			logger.info("[email dao] 아이디 조회 성공");
		}
		
		return result;
	}

}
