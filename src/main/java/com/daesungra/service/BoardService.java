package com.daesungra.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.daesungra.domain.BoardVo;

public interface BoardService {

	public List<BoardVo> getBoardList (int category);
	public BoardVo boardView (String serial);
	public boolean boardWrite (HttpServletRequest request);
	public boolean boardModify (HttpServletRequest request);
	public boolean boardDelete (HttpServletRequest request);
}
