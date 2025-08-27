package com.musicismylife.domain.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostController {

	@RequestMapping("/post/view")
	public String showPost() {
		return "post/view";
	}
	@RequestMapping("/post/write")
	public String writepost() {
		return "post/write";
		
	}
	
}
