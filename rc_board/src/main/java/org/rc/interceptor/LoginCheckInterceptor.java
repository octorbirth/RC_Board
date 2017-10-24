package org.rc.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		 HttpSession session = request.getSession();
	     
		 Cookie loginCookie = WebUtils.getCookie(request, "login");
		 
		 if (loginCookie == null) {
	            response.sendRedirect("/login");
	            return false;
	        }
		 
	     return true;

	}
	
}
