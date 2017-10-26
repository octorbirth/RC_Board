package org.rc.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.extern.java.Log;

@Controller
@RequestMapping("/profile/*")
@Log
public class ProfileController {
	@GetMapping("/view")
	public void view() {
		return;
	}
}
