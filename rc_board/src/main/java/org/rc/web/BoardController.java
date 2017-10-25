package org.rc.web;

import java.util.Arrays;

import org.rc.dto.BoardDTO;
import org.rc.dto.Criteria;
import org.rc.dto.SearchCriteria;
import org.rc.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/board/*")
@Log
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") SearchCriteria cri) {
		log.info("==================================");
		log.info("�˻��з� : " + cri.getSearchType() );
		log.info("�˻�Ű���� : " + cri.getKeyword() );
		log.info("==================================");
		model.addAttribute("list", service.list(cri));
		
		return;
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
	public void mod(Long bno, @ModelAttribute("cri") Criteria cri, Model model) {	
		model.addAttribute("board",service.get(bno));
	}
	@PostMapping("/modify")
	public String modify(BoardDTO dto, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {	
		rttr.addAttribute("bno", dto.getBno()); // url�� ǥ��
		
		service.deleteFiles(dto.getBno());
		service.modify(dto);
		
		rttr.addFlashAttribute("result", "modsuccess");
		return "redirect:/board/view" + cri.getURI();
		// ��ü�� ���� ������ ������ �ڵ����� �� ���ڸ� �ҹ��ڷ� �ؼ� ó���Ѵ�.
	}
	@PostMapping("/remove")
	public String remove(RedirectAttributes rttr, BoardDTO dto) {
		service.remove(dto.getBno());
		rttr.addFlashAttribute("result", "delsuccess");
		return "redirect:/board/list";
	}
	
}
