package com.musicismylife.domain.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.musicismylife.domain.post.PostDTO;

@Controller
public class CommentController {
	
	@Autowired
	private CommentMapper commentMapper;
	
	@RequestMapping("/commentList")
	public ModelAndView commentList(PostDTO postDTO) {
		
		// 댓글 수량 가져오기
		int commentCount = 0;
		commentCount = commentMapper.getCommentCount(postDTO);
		
		// 댓글 목록 가져오기
		List<CommentDTO> commentDTO = commentMapper.getCommentList(postDTO);

		ModelAndView mv = new ModelAndView();
		mv.addObject("comment", commentDTO);
		mv.addObject("count", commentCount);
		mv.setViewName("comment/commentList");
		
		return mv;
	}
	
	@RequestMapping("/commentWrite")
	public ModelAndView commentWrite(CommentDTO commentDTO) {
		String postID = "";
		
		postID = Integer.toString(commentDTO.getPost_id());
		
		System.out.println("작성내용: " + commentDTO);
		System.out.println("원글번호:" + postID);
		
		commentMapper.insertComment(commentDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/post/detail/${" + postID + "}");
		
		return mv;
	}
	
	@GetMapping("/commentDel")
	public ModelAndView commentDelete(CommentDTO commentDTO) {
		commentMapper.deleteComment(commentDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("comment/commentList");
		
		return mv;
	}
	
	@GetMapping("/commentUpdateForm")
	public ModelAndView getComment(CommentDTO commentDTO) {
		commentDTO = commentMapper.getComment(commentDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("comment", commentDTO);
		mv.setViewName("comment/commentUpdateForm");
		
		return mv;
	}
	
	@PostMapping("/commentUpdate")
	public ModelAndView updateComment(CommentDTO commentDTO) {
		commentMapper.updateComment(commentDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("comment/commentList");
		
		return mv;
	}
}
