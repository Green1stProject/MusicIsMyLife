package com.musicismylife.interceptor;

import java.text.MessageFormat;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AuthInterceptor implements HandlerInterceptor {
	
	// Interceptor : 페이지가 이동할때 Controller 앞에서 가로채기하는 클래스
	// 전처리(로그인)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		
		String requestURI  =  request.getRequestURI();
		String member_id   =  request.getParameter("member_id");
		
		log.info("uri:", requestURI);
		
		// 없으면: 무한 반복 호출 
		// /member/login, /member/loginAction 을 제외
		if( requestURI.contains("/member/login")) {
			return true;
		}
		if( requestURI.contains("/member/loginAction")) {
			return true;
		}
			
		HttpSession   session =  request.getSession();
		Object        login   =  session.getAttribute("login");
		
		if( login == null ) {
			// 로그인되어 있지 않다면, 로그인 페이지로 이동
			String loc = "/member/login";
			response.sendRedirect( loc );   // GEt 방식요청
			return   false;
		}
		
	    // preHandle 의 return 문의 의미는
	    // 컨트롤러 요청 url 로 가도되나 안되나 결정
	    // return true : 컨트롤러 url 로 가게 된다 
		return true;
	}

	/*
	// 후처리
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	*/
	
}









