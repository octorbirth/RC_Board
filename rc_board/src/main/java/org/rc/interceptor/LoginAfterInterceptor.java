package org.rc.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            request.getSession().setAttribute("memberDTO", map.get("memberDTO"));   // session�� ����.
        }
	}

}
