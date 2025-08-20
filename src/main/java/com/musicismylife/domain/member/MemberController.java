package com.musicismylife.domain.member;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.musicismylife.domain.member.MemberDTO;
import com.musicismylife.domain.member.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
		
	@RequestMapping("/member/register")
	public String MemberForm() {
		return "member/register"; 
	}
	
	@RequestMapping("/member/insert")
	public String insertMember(MemberDTO memberDTO) {
		
		memberMapper.insertMember(memberDTO);
		
		return "member/login";
	}
	
	@RequestMapping("/member/login")
	public String loginForm() {
		return "member/login";
	}
	
	@RequestMapping("/member/mypage")
	public String viewmyInfo(MemberDTO memberDTO) {
		
		System.out.println(memberDTO);
		//memberDTO = memberMapper.getMember(memberDTO);
		
		//ModelAndView mv = new ModelAndView();
		//mv.addObject("member", memberDTO);
		
		return "member/mypage";
	}
	
	@PostMapping("/member/loginAction")
	public String loginAction(HttpServletRequest request, HttpServletResponse response) {
		// 넘어온 로그인정보 처리
		String member_id   =  request.getParameter("member_id");
		String member_pw  =  request.getParameter("member_pw");

		// DB 조회
		MemberDTO memberDTO = memberMapper.login(member_id, member_pw);
		//System.out.println( memberDTO );
		
		// 다른페이지에서 볼수있도록 session 에 저장
		HttpSession session  =  request.getSession();
		session.setAttribute("login", memberDTO);

		// 돌아갈 주소 설정: 마이페이지로 이동 (추후 페이지 정해지면 변경하기)
		return "/member/test";
	}
	
	@RequestMapping(value= "/Logout", method = RequestMethod.GET  )   //  == @GetMapping
	public  String  logout(HttpServletRequest request, HttpServletResponse response, HttpSession session  ) {
		session.invalidate();   // session을 초기화
		
		// Object  url         = session.getAttribute("URL");
		// return  "redirect:" + (String_ url;
		return  "redirect:/";
	}

}
