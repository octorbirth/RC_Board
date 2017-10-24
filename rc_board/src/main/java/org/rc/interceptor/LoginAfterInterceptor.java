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
		
		String auto = request.getParameter("auto");
		
		
		Map<String, Object> map = modelAndView.getModel();  // model을 가져온다.
        
        if(map.get("memberVO") != null) { // 로그인 성공했다면 not null
        	
        	request.getSession().setAttribute("memberVO", map.get("memberVO")); // session발급
        	
        	if (auto != null) { // 자동 로그인 유무 (쿠키 발급 유무)
        		MemberVO vo = (MemberVO)map.get("memberVO");
        		Cookie loginCookie = new Cookie("login", vo.getMid());
        		loginCookie.setMaxAge(5*60); // 5분간 지속 (브라우저 껐다 켜도 지속)
        		response.addCookie(loginCookie);
        	}
        	response.sendRedirect("/board/list");
        	return;
        }
	}

}
