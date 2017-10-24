package org.rc.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.rc.dto.MemberDTO;
import org.rc.service.MemberService;
import org.rc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Controller
@Log
public class LoginController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/login")
    public void login() {
        
    }
    
    @PostMapping("/login")
    public void loginPost(MemberDTO info, Model model) {
        MemberDTO dto = new MemberDTO();
        log.info("받은 이름 이름: " + info.getMname());
        dto.setMid(info.getMid());
        dto.setMpw(info.getMpw());
        dto.setMname(info.getMname());
        
        log.info("회원가입 이름: " + dto.getMname());
        if(dto.getMname() != null) { // 회원가입 시도라면... (mname이 존재)
        	service.create(dto);
        	model.addAttribute("memberVO", dto);
        }else {
        	model.addAttribute("memberVO", service.login(dto));	
        }
        return;
    }
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
    	log.info("logout.....................");
    	
    	Object obj = session.getAttribute("memberVO");

   	  	if (obj != null) {
   	  		MemberVO vo = (MemberVO) obj;
   	  		session.removeAttribute("login");
   	  		session.invalidate();
	   	  
   	  		Cookie loginCookie = WebUtils.getCookie(request, "login");
	
   	  		if (loginCookie != null) {
	   	  
	   		  loginCookie.setPath("/");
	   		  loginCookie.setMaxAge(0);
	   		  response.addCookie(loginCookie);
	   	  
   	  		}
	   	} 

   	  	return "redirect:/login";
    	
    }
}
