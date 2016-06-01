package org.teamAT.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board/")
public class BoardController {
	
	@RequestMapping("notice")
    public String viewNotice(){
		System.out.println("notice");
		return "/board/notice";
	}
}
