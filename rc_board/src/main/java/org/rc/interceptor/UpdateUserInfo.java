package org.rc.interceptor;

import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.java.Log;

@Log
public class UpdateUserInfo extends HandlerInterceptorAdapter {
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		if (request.getMethod().equals("GET")) { // get����� ó���ϱ� ���� (�Ʒ� root-context.xml ����
			return;
		}

		Map<String, Object> map = modelAndView.getModel(); // model�� �����´�.
		
		if (map.get("MemberDTO") != null) { // �α��� �����ߴٸ� not null
			
			Object obj = request.getSession().getAttribute("memberVO");
			if (obj != null) {
				
				request.getSession().removeAttribute("memberVO");
				request.getSession().invalidate();
		   	} 
			request.getSession().setAttribute("memberVO", map.get("memberVO"));
			response.sendRedirect("/board/list");
			return;
		}
		
	}
	

}
