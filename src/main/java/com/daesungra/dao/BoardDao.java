package com.daesungra.dao;

import java.util.List;

import com.daesungra.domain.BoardVo;
import com.daesungra.domain.MemberVo;

public interface BoardDao {

	public List<BoardVo> getBoardList (int category);
	public BoardVo boardSelect (String serial);
	public boolean boardInsert (MemberVo vo);
	public boolean boardUpdate (MemberVo vo);
	public boolean boardDelete (String serial);
}
