package org.rc.interceptor;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.rc.dto.BoardDTO;
import org.rc.service.BoardService;
import org.rc.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class ViewInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private BoardService service;

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		Map<String, Object> map = modelAndView.getModel();
		BoardDTO dto = (BoardDTO) map.get("board");
		Long bno = dto.getBno();
		
		log.info("조회 번호 : " + bno);
		Cookie viewCk = WebUtils.getCookie(request, "viewCk");
		boolean useCookie = viewCk != null ? true : false;

		if (useCookie) { // 이미 쿠키가 발급 되어 있다면
			String strBno = Long.toString(bno);
			String str = viewCk.getValue();
			log.info("현재 쿠키 value : " + str);
			String[] arr = str.split("_");

			boolean check = true;
			for (int i = 0; i < arr.length; i++) {
				if (arr[i].equals(strBno)) {
					log.info("이미 조회한 게시글");
					check = false;
					break;
				}
			}
			if(check) { // 아직 조회하지 게시글이면
				service.viewcntUp(bno);
				
				String updatedStr = str + "_" + strBno;
				
				viewCk.setValue(updatedStr);
				response.addCookie(viewCk);
				log.info("쿠키 갱신(중복 조회 방지)");
			}

		} else { // 아직 쿠키가 발급 되기 전이면 새로 발급
			service.viewcntUp(bno);
			Cookie ck = new Cookie("viewCk", "" + bno);
			ck.setMaxAge(24 * 60 * 60);
			response.addCookie(ck);
		}

		return;
	}
}
