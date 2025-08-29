package com.musicismylife.domain.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.musicismylife.domain.comment.CommentDTO;
import com.musicismylife.domain.comment.CommentMapper;


@Controller
public class TestController {
   @Autowired
   private TestMapper testMapper;
   
   @Autowired
   private CommentMapper commentMapper;
	
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
		System.out.println("안녕~22");
		System.out.println(testList);
		return "/viewTest";
	}
	
	
	@RequestMapping("/post/detail/{postID}")
	public String showPostDetail(@PathVariable String postID, Model model) {
	    System.out.println("글번호: " + postID);
	    
	    TestDTO post = testMapper.getPost(postID);
	    
	    // 댓글 목록이랑  댓글 수 가져와서 모델에 추가하셈...
	    List<CommentDTO> commentList = commentMapper.getCommentList(postID);
	    int commentCount = commentMapper.getCommentCount(postID);
	    
	    model.addAttribute("post", post);
	    model.addAttribute("comment", commentList);      // commentList.jsp에서 사용
	    model.addAttribute("commentList", commentList);  // 혹시 다른 곳에서 사용할 수도 있으니
	    model.addAttribute("count", commentCount);       // 댓글 수 (int 타입으로 반환!!!!!!!!!!)
	    
	    System.out.println("댓글 수: " + commentCount);
	    System.out.println("댓글 목록: " + commentList);
	    
	    return "/viewTestDetail";
	}
}
