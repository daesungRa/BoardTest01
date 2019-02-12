package com.daesungra.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@RequestMapping(value="/categoryFour", method=RequestMethod.GET)
	public String getBoardPage () {
		logger.info("call boardPage");
		
		return "/board/boardPage";
	}
}
