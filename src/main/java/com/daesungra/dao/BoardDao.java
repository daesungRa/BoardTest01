package com.daesungra.dao;

import java.util.List;
import java.util.Map;

import com.daesungra.domain.BoardVo;
import com.daesungra.domain.BookVo;
import com.daesungra.domain.CommentVo;

public interface BoardDao {

	public List<BoardVo> getBoardList (Map<String, Object> pagenatedInputData);
	public List<BookVo> getBookInfo (String search);
	public BoardVo boardSelect (BoardVo bvo);
	public boolean boardInsert (BoardVo bvo);
	public boolean boardUpdate (BoardVo bvo);
	public boolean boardDelete (BoardVo bvo);
	
	public List<CommentVo> getCommentList (int serial);
	
}
