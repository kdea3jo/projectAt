package org.teamAT.controller;

import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.teamAT.service.BoardService;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@Autowired
	BoardService service;
	
	@RequestMapping(value="*/list", method = RequestMethod.GET)
	public String getList(HttpServletRequest request){
		service.getList(request, getBoardName(request));
		request.setAttribute("boardname", getBoardName(request));
		return "/board/"+getBoardName(request)+"/list";
	}
	@RequestMapping(value="*/read", method = RequestMethod.GET)
	public String getContent(HttpServletRequest request){
		service.getContent(request,getBoardName(request));
		return "/board/"+getBoardName(request)+"/read";
	}
	
	@RequestMapping(value="notice/write", method = RequestMethod.GET)
	public String noticeInsert(HttpServletRequest request){
		return "/board/e";
	}
	
	public String getBoardName(HttpServletRequest request){
		String[] temp = request.getRequestURI().split("/");
		System.out.println(temp[3]);
		return temp[3];
	}
	
}
