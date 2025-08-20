package com.musicismylife;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//gg
@Controller
public class HomeController {
	@GetMapping("/")
	public String home() {
		return "home"; 
	}
}
