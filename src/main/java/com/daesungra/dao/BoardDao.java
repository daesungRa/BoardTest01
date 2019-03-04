package com.daesungra.dao;

import java.util.List;

import com.daesungra.domain.BoardVo;
import com.daesungra.domain.BookVo;

public interface BoardDao {

	public List<BoardVo> getBoardListDate (int category);
	public List<BoardVo> getBoardListHit (int category);
	public List<BookVo> getBookInfo (String search);
	public BoardVo boardSelect (BoardVo vo);
	public BoardVo boardInsert (BoardVo vo); // insert 성공 시 조회
	public BoardVo boardUpdate (BoardVo vo);
	public boolean boardDelete (String serial);
}
