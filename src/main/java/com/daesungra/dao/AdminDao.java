package com.daesungra.dao;

import java.util.List;

import com.daesungra.domain.BoardReportVo;

public interface AdminDao {
	public List<BoardReportVo> selectBoardReportList (BoardReportVo brvo);
}
