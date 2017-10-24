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
		
		if(request.getMethod().equals("GET")) {  // get����� ó���ϱ� ���� (�Ʒ� root-context.xml ����
            return;
        }
		log.info("�α��� �� ó��");
		Map<String, Object> map = modelAndView.getModel();  // model�� �����´�.
        
        if(map.get("memberDTO") != null) {
        	MemberVO vo = (MemberVO)map.get("memberVO");
            Cookie loginCookie = new Cookie("login", vo.getMid());
            loginCookie.setMaxAge(2*60); // 2�а� ���� (������ ���� �ѵ� ����)
            response.addCookie(loginCookie);
        }
	}

}
