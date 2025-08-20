package com.musicismylife.domain.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	@GetMapping("/login")
	public String showLogin() {
		return "member/login"; 
	}

	@GetMapping("/register")
	public String showRegister() {
		return "member/register"; 
	}
}


