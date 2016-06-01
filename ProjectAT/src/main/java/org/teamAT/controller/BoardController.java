package org.teamAT.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.teamAT.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value="noticelist", method = RequestMethod.GET)
	public String getList(HttpServletRequest request){
		service.getList(request);
		return "/board/notice";
	}
}
