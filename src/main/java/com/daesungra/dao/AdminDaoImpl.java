package com.daesungra.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.daesungra.controller.AdminController;
import com.daesungra.domain.BoardReportVo;

@Repository
public class AdminDaoImpl implements AdminDao {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardReportVo> selectBoardReportList (Map<String, Object> pagenatedInputData) {
		List<BoardReportVo> brvoList = null;
		brvoList = sqlSession.selectList("admin.getBoardReportList", pagenatedInputData);
		if (brvoList != null) {
			logger.info("[get board report list - dao] 조회 성공, 리스트 길이 : " + brvoList.size());
		} else {
			logger.info("[get board report list - dao] 조회 실패");
		}
		
		return brvoList;
	}
	
	@Override
	public BoardReportVo selectBoardReportInfo (int serial) {
		BoardReportVo brvo = null;
		brvo = sqlSession.selectOne("admin.selectBoardReportInfo", serial);
		
		return brvo;
	}
	
	@Override
	public boolean deleteBoardReport (int serial) {
		boolean result = false;
		int updateResult = sqlSession.update("admin.deleteBoardReport", serial);
		if (updateResult > 0) {
			logger.info("[board report delete - dao] 신고 요청 처리 성공");
			result = true;
		}
		
		return result;
	}
	
	@Override
	public boolean updateBoardBlockAction (int fSerial) {
		boolean result = false;
		int updateResult = sqlSession.update("admin.updateBoardBlock", fSerial);
		if (updateResult > 0) {
			logger.info("[block reported board - dao] 블럭 처리 완료");
			result = true;
		}
		
		return result;
	}
	
	@Override
	public boolean updateBoardBlockFreeAction (int fSerial) {
		boolean result = false;
		int updateResult = sqlSession.update("admin.updateBoardBlockFree", fSerial);
		if (updateResult > 0) {
			logger.info("[free blocked board - dao] 블럭 해제 완료");
			result = true;
		}
		
		return result;
	}
}
