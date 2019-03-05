package com.daesungra.service;

import java.util.List;
import java.util.Map;

import com.daesungra.domain.BoardVo;
import com.daesungra.domain.BookVo;

public interface BoardService {
	public List<BoardVo> getBoardListDate (Map<String, Object> pagenatedInputData);
	public List<BoardVo> getBoardListHit (Map<String, Object> pagenatedInputData);
	public List<BookVo> getBookInfo (String search);
	public BoardVo boardView (BoardVo bvo);
	public boolean boardWrite (BoardVo bvo); // 등록 및 수정 이후 해당 게시글 조회까지 수행
	public boolean boardModify (BoardVo bvo);
	public boolean boardRemove (BoardVo bvo);
}
