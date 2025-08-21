package com.musicismylife.domain.member;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.musicismylife.domain.member.MemberDTO;
import com.musicismylife.domain.member.MemberMapper;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
		
	@GetMapping("/register")
	public String MemberForm() {
		/** 회원가입폼 페이지이동 */
		return "member/register"; 
	}
	
	@PostMapping("/insert")
	public ModelAndView insertMember(MemberDTO memberDTO) {
		/** 회원가입 처리 */
		memberMapper.insertMember(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/login");
		
		return mv;
	}
	
	@PostMapping("/mypage")
	public ModelAndView viewMyInfo(MemberDTO memberDTO) {
		/** 회원 개인정보 조회
		 *  입력값: member_id 
		 * */
		//System.out.println("아이디: " + memberDTO);
		memberDTO = memberMapper.getMember(memberDTO);
		
		//System.out.println("회원정보: " + memberDTO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", memberDTO);
		mv.setViewName("member/mypage");
		
		return mv;
	}
	
	@PostMapping("/UpdateForm")
	public ModelAndView updateForm(MemberDTO memberDTO) {
		/** 수정:회원 개인정보 조회
		 *  입력값: member_id 
		 */
		memberDTO = memberMapper.getMember(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", memberDTO);
		mv.setViewName("member/profileEdit");
		
		return mv;
	}
	
	@PostMapping("/UpdateAction")
	public ModelAndView updateAction(MemberDTO memberDTO) {
		/** 회원 개인정보 수정 
		 *  입력값: 수정정보 
		 * */
		memberMapper.updateMember(memberDTO);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", memberDTO);
		mv.setViewName("member/mypage");
		
		return mv;
	}
	
	@GetMapping("/loseKey")
	public String updateKeyForm() {
		/** 비밀번호 변경하기 페이지 이동 */ 
		return "member/updateKeyForm";
	}
	
	@PostMapping("/updateKey")
	public ModelAndView updateKey(MemberDTO memberDTO) {
		/** 회원 비밀번호 수정
		 *  입력값: member_id, member_pw 
		 *  */
		String member_id = "";
		String changeKey = "";
		
		member_id = memberDTO.getMember_id();
		changeKey = memberDTO.getMember_pw();
		
		// DB 에서 회원 조회 
		memberDTO = memberMapper.getMember(memberDTO);
		ModelAndView mv = new ModelAndView();
		// 회원 아이디가 존재한다면 비밀번호 변경 후 로그인 페이지로 이동
		if (memberDTO != null) {
			memberMapper.updateKey(member_id, changeKey);
			mv.setViewName("member/login");
		} else {
			// 회원이 아니라면 회원가입 페이지로 이동
			mv.setViewName("member/register");
		}
		return mv;
	}

	@GetMapping("/login")
	public String loginForm() {
		/** 로그인 페이지 이동 */
		return "member/login";
	}
	
	@PostMapping("/loginAction")
	public String loginAction(HttpServletRequest request, HttpServletResponse response) {
		/** 로그인 처리
		 * 입력값: member_id, member_pw
		 */
		// 넘어온 로그인정보 처리
		String member_id   =  request.getParameter("member_id");
		String member_pw  =  request.getParameter("member_pw");

		// DB 조회
		MemberDTO memberDTO = memberMapper.login(member_id, member_pw);
		//System.out.println( memberDTO );
		
		// 다른페이지에서 볼수있도록 session 에 저장
		HttpSession session  =  request.getSession();
		session.setAttribute("login", memberDTO);

		// === 돌아갈 주소 설정: 마이페이지로 이동 (추후 페이지 정해지면 변경하기) ===/
		return "/member/testmain";
	}
	
	/* 로그아웃 처리
	public  String  logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.invalidate();   // session을 초기화
		
		// Object  url         = session.getAttribute("URL");
		// return  "redirect:" + (String_ url;
		return  "redirect:/";
	}
	*/

}
