package org.rc.interceptor;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.rc.vo.MemberVO;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.java.Log;

@Log
public class LoginAfterInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		if(request.getMethod().equals("GET")) {  // get방식을 처리하기 위해 (아래 root-context.xml 참고
            return;
        }
		log.info("로그인 후 처리");
		Map<String, Object> map = modelAndView.getModel();  // model을 가져온다.
        
        if(map.get("memberDTO") != null) {
        	MemberVO vo = (MemberVO)map.get("memberVO");
            Cookie loginCookie = new Cookie("login", vo.getMid());
            loginCookie.setMaxAge(2*60); // 2분간 지속 (브라우저 껐다 켜도 지속)
            response.addCookie(loginCookie);
        }
	}

}
