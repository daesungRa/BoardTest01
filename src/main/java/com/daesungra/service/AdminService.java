package com.daesungra.service;

import java.util.List;
import java.util.Map;

import com.daesungra.domain.BoardReportVo;

public interface AdminService {
	
	public List<BoardReportVo> getBoardReportList (Map<String, Object> pagenatedInputData);
	
}
