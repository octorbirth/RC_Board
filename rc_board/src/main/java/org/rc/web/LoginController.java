package org.rc.web;

import org.rc.dto.MemberDTO;
import org.rc.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.java.Log;

@Controller
@Log
public class LoginController {
	
	@GetMapping("/login")
    public void login() {
        
    }
    
    @PostMapping("/login")
    public void loginPost(MemberDTO dto, Model model) {
        MemberVO member = new MemberVO();
        member.setMid(dto.getMid());
        member.setMpw(dto.getMpw());
        member.setMname("사용자" + dto.getMid());
        log.info("세션 발급");
        model.addAttribute("memberDTO", member);
    }

}
