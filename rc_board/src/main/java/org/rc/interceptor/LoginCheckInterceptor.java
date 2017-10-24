package org.rc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.java.Log;

@Log
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		 HttpSession session = request.getSession();
	        
	     // this member not yet logined
	     if(session.getAttribute("memberDTO") == null) {
	    	 response.sendRedirect("/login"); // 튕겨내기
	    	 return false; // 반환값
	     }
	         return true;

	}
	
}
