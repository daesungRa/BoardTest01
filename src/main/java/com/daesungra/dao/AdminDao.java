package com.daesungra.dao;

import java.util.List;
import java.util.Map;

import com.daesungra.domain.BoardReportVo;

public interface AdminDao {
	
	public List<BoardReportVo> selectBoardReportList (Map<String, Object> pagenatedInputData); // 신고 리스트
	public BoardReportVo selectBoardReportInfo (int serial); // 신고 정보 조회
	public boolean deleteBoardReport (int serial); // 신고 정보 처리 완료
	public boolean updateBoardBlockAction (int fSerial); // 신고된 게시글 블럭 처리
	public boolean updateBoardBlockFreeAction (int fSerial); // 블럭 해제
	
}
