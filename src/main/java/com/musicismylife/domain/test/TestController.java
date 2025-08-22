package com.musicismylife.domain.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TestController {
	@Autowired
	private TestMapper  testMapper;
	
	@RequestMapping("/viewTest")
	public String showPost(Model model) {
		List<TestDTO> testList = testMapper.getPostList(); 
		model.addAttribute("testList",testList);
		System.out.println("안녕~");
		System.out.println(testList);
		return "/viewTest";
	}
	
	@RequestMapping("/viewTest/{emotionCode}")
	public String showEmoteCategory(@PathVariable String emotionCode, Model model) {
		
		List<TestDTO> testList = testMapper.getPostListByEmotion(emotionCode); 
		model.addAttribute("testList", testList);
		return "/viewTest";
	}
}
