package org.rc.web;

import org.rc.dto.BoardDTO;
import org.rc.dto.Criteria;
import org.rc.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/board/*")
@Log
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("list", service.list(cri));
	}
	
	@GetMapping("/register")
	public void registerGet() {

	}
	
	@PostMapping("/register")
	public String register(BoardDTO dto, RedirectAttributes rttr) {
		
		service.register(dto);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/board/list";
	}
	
	
	@GetMapping("/view")
	public void view(Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("board", service.get(bno));
	}
	
	
	@GetMapping("/modify")
	public void mod() {	
		
	}
	
}
