package com.daesungra.service;

import java.util.List;
import java.util.Map;

import com.daesungra.domain.BoardReportVo;

public interface AdminService {
	
	public List<BoardReportVo> getBoardReportList (Map<String, Object> pagenatedInputData); // 신고 리스트
	public BoardReportVo getBoardReportInfo (int serial); // 신고 정보 조회
	public boolean boardReportCompleteAction (int serial); // 신고 정보 처리 완료
	public boolean boardBlockAction (int fSerial); // 신고된 게시글 블럭 처리
	public boolean boardBlockFreeAction (int fSerial); // 블럭 해제
	
}
