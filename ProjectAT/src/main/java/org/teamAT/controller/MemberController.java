package org.teamAT.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@RequestMapping("login")
	public String login(){
		System.out.println("오냐?");
		return "/member/login";
	}
	
	@RequestMapping("join")
	public String join(){
		System.out.println("오냐?");
		return "/member/join";
	}
}
