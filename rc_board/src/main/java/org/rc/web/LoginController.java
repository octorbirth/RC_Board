package org.rc.web;

import org.rc.dto.MemberDTO;
import org.rc.service.MemberService;
import org.rc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
        log.info("���� �̸� �̸�: " + info.getMname());
        dto.setMid(info.getMid());
        dto.setMpw(info.getMpw());
        dto.setMname(info.getMname());
        
        log.info("ȸ������ �̸�: " + dto.getMname());
        if(dto.getMname() != null) { // ȸ������ �õ����... (mname�� ����)
        	service.create(dto);
        	model.addAttribute("memberVO", dto);
        }else {
        	model.addAttribute("memberVO", service.login(dto));	
        }
        
    }

}
