package org.rc.web;

import java.util.List;

import org.rc.dto.AttendDTO;
import org.rc.dto.BoardDTO;
import org.rc.dto.MemberDTO;
import org.rc.dto.SearchCriteria;
import org.rc.service.AttendService;
import org.rc.service.MemberService;
import org.rc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/attend/*")
@Log
public class AttendController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private AttendService attendService;
	
	@GetMapping("/list")
	public void list() {
		return;
	}
	@GetMapping("/register")
	public void register(Model model) {
		model.addAttribute("list", memberService.getList());
		return;
	}
	@PostMapping("/register")
	public String register(MemberDTO dto) {
		log.info("=======================");
		AttendDTO attendDto = new AttendDTO();
		attendDto.setMlist(dto.getMlist());
		attendDto.setNamelist(dto.getNamelist());
		
		
		String mlist[] = dto.getMlist();
		String alist[] = dto.getAlist();
		String []attend = new String[mlist.length];
		
		int flag = 0, count = 0;
		for (int i = 0; i < alist.length; i++) {
			if(alist[i] != null) {
				attend[i] = "y";
				count++;
			}else {
				attend[i] = "n";
			}
			flag = i+1;
			log.info(alist[i] + " 출석여부 : " + attend[i]);
		}
		for(int i = flag; i< mlist.length; i++) {
			attend[i] = "n";
			log.info(mlist[i] + " 출석여부 : " + attend[i]);
		}
		
		log.info("=======================");
		attendDto.setAttend(attend);
		attendDto.setCount(count);
		attendService.create(attendDto);
		return "redirect:/attend/list";
	}
	
	@GetMapping("/view")
	public void view() {
		return;
	}
	
}
