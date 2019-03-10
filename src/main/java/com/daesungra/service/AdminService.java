package com.daesungra.service;

import java.util.List;

import com.daesungra.domain.BoardReportVo;

public interface AdminService {
	
	public List<BoardReportVo> getBoardReportList (BoardReportVo brvo);
	
}
