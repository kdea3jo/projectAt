package org.teamAT.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DefaultController {

	@RequestMapping("/main")
	public String viewMain(HttpServletRequest request){
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		if(!auth.getName().equals("anonymousUser")){
			request.getSession().setAttribute("id", auth.getName());
		}
		return "main";
	}
}
