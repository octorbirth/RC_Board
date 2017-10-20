package org.rc.web;

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
	@GetMapping("/list")
	public void list() {
			
	}
	
	@GetMapping("/register")
	public void registerGet() {

	}
	
	
	@GetMapping("/view")
	public void view() {
		
	}
	
	
	@GetMapping("/modify")
	public void mod() {	
		
	}
	
}
