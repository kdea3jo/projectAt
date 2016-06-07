package org.teamAT.controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.teamAT.service.MemberService;
import org.teamAT.vo.MemberVo;

@Controller
@RequestMapping("/member/")
public class MemberController {

	@Autowired
	private MemberService ms;

	@RequestMapping("loginform")
	public String viewLoginForm() {
		return "/member/login";
	}

	@RequestMapping("joinform")
	public String viewJoinForm() {
		return "/member/join";
	}

	@RequestMapping("mypage")
	public String viewMypage() {
		return "/member/mypage";
	}

	@ResponseBody
	@RequestMapping("modifyform")
	public boolean viewModifyForm(@RequestParam String pw, HttpServletRequest request) {
		return ms.checkPw(pw, request);
	}

	@ResponseBody
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public boolean join(MemberVo vo) throws ParseException {
		System.out.println("±×³É");
		/*boolean result = ms.join(request);*/
		return false;
	}

}
