package org.teamAT.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@RequestMapping("loginform")
	public String viewLoginForm(){
		return "/member/login";
	}
	
	@RequestMapping("joinform")
	public String join(){
		return "/member/join";
	}
}
