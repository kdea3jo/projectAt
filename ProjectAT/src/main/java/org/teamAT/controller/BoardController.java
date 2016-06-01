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
	
	@RequestMapping("notice")
    public String viewNotice(){
		System.out.println("notice");
		return "/board/notice";
	}
	
	@RequestMapping(value="list", method = {RequestMethod.GET, RequestMethod.POST})
	public String getList(HttpServletRequest request){
		service.getList(request);
		return "/board/notice";
	}
}
