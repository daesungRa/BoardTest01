package com.daesungra.dao;

import java.util.List;
import java.util.Map;

import com.daesungra.domain.BoardReportVo;

public interface AdminDao {
	public List<BoardReportVo> selectBoardReportList (Map<String, Object> pagenatedInputData);
}
