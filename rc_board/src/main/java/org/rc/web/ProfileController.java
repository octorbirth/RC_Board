package org.rc.web;

import org.rc.dto.MemberDTO;
import org.rc.service.BoardService;
import org.rc.service.MemberService;
import org.rc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.java.Log;

@Controller
@RequestMapping("/profile/*")
@Log
public class ProfileController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/view")
	public void view(MemberDTO dto, Model model) {
		model.addAttribute("members",service.getInfo(dto));
		return;
	}
	@GetMapping("/management")
	public void management() {
		
		return;
	}
}
