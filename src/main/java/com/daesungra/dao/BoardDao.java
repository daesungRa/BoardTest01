package com.daesungra.dao;

import java.util.List;

import com.daesungra.domain.BoardVo;

public interface BoardDao {

	public List<BoardVo> selectTest ();
	public BoardVo select ();
	public boolean insert ();
	public boolean update ();
	public boolean delete ();
}
