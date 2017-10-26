package org.rc.web;

import org.rc.dto.SearchCriteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/attend/*")
@Log
public class AttendController {
	@GetMapping("/list")
	public void list() {
		return;
	}
	@GetMapping("/register")
	public void register() {
		return;
	}
	@GetMapping("/view")
	public void view() {
		return;
	}
}
