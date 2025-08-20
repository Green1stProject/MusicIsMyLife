package com.musicismylife.domain.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class TestController {
	@GetMapping("/viewTest")
	public String showPost() {
		return "/viewTest";
	}
}
