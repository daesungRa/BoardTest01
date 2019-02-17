package com.daesungra.service;

import java.util.List;

import com.daesungra.domain.BoardVo;

public interface BoardService {

	public List<BoardVo> selectTest ();
	public BoardVo view ();
	public boolean write ();
	public boolean modify ();
	public boolean delete ();
}
