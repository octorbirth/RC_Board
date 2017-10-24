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
	     
		 // �ΰ��� ���� : session�� �ְų� cookie�� �ְų� ��Ű�� ������ üũ
	     boolean useSession = request.getSession().getAttribute("memberVO") != null? true : false;
		 
	     if(useSession) {
	            log.info("current user uses session");
	            return true;
	     }
	     
	     
		 Cookie loginCookie = WebUtils.getCookie(request, "login");
		 
		 boolean useCookie = loginCookie != null? true: false;
		 if(useCookie) {
			 	log.info("current user uses session");
	            return true;            
	      }
		 
		 response.sendRedirect("/login");
		 
	     return false;

	}
	
}
