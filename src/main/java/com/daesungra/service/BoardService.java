package com.daesungra.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.daesungra.domain.BoardVo;
import com.daesungra.domain.BookVo;

public interface BoardService {
	public List<BoardVo> getBoardListDate (int category);
	public List<BoardVo> getBoardListHit (int category);
	public List<BookVo> getBookInfo (String search);
	public BoardVo boardView (String serial);
	public boolean boardWrite (HttpServletRequest request);
	public boolean boardModify (HttpServletRequest request);
	public boolean boardDelete (HttpServletRequest request);
}
