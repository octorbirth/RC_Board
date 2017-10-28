package org.rc.web;

import java.util.List;

import org.rc.dto.AttendDTO;
import org.rc.dto.BoardDTO;
import org.rc.dto.MemberDTO;
import org.rc.dto.ReplyDTO;
import org.rc.dto.SearchCriteria;
import org.rc.service.AttendService;
import org.rc.service.LectureService;
import org.rc.service.MemberService;
import org.rc.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@Autowired
	private LectureService lectureService;
	
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", lectureService.list());
		String total = Integer.toString(lectureService.getAmount());
		model.addAttribute("total", total);
		return;
	}
	@GetMapping("/register")
	public void register(Model model) {
		model.addAttribute("list", memberService.getList());
		return;
	}
	@PostMapping("/register")
	public String register(MemberDTO dto) {
		//log.info("=======================");
		AttendDTO attendDto = new AttendDTO();
		attendDto.setMlist(dto.getMlist());
		attendDto.setNamelist(dto.getNamelist());
		
		
		String mlist[] = dto.getMlist();
		String alist[] = dto.getAlist();
		String []attendlist = new String[mlist.length];
		
		int flag = 0, count = 0;
		for (int i = 0; i < alist.length; i++) {
			if(alist[i] != null) {
				attendlist[i] = "y";
				count++;
			}else {
				attendlist[i] = "n";
			}
			flag = i+1;
			//log.info(mlist[i] + " 출석여부 : " + attend[i]);
		}
		for(int i = flag; i< mlist.length; i++) {
			attendlist[i] = "n";
			//log.info(mlist[i] + " 출석여부 : " + attend[i]);
		}
		
		//log.info("=======================");
		attendDto.setAttendlist(attendlist);
		attendDto.setCount(count);
		attendService.create(attendDto);
		return "redirect:/attend/list";
	}
	
	@GetMapping("/view")
	public void view(@ModelAttribute("lno") Integer lno, Model model) {
		model.addAttribute("list", attendService.getView(lno));
		return;
	}
	@PostMapping("/remove")
	public String remove(AttendDTO dto) {
		lectureService.remove(dto.getLno());
		return "redirect:/attend/list";
	}
	@PostMapping("/modify")
	public String modify(MemberDTO dto, Integer lno) {
		
		
		AttendDTO attendDto = new AttendDTO();
		attendDto.setMlist(dto.getMlist());
		attendDto.setNamelist(dto.getNamelist());
		
		
		String mlist[] = dto.getMlist();
		String alist[] = dto.getAlist();
		String []attendlist = new String[mlist.length];
		//log.info("=======================");
		int flag = 0, count = 0;
		for (int i = 0; i < alist.length; i++) {
			if(alist[i] != null) {
				attendlist[i] = "y";
				count++;
			}else {
				attendlist[i] = "n";
			}
			flag = i+1;
			//log.info("수정된 " + mlist[i] + " 출석여부 : " + attendlist[i]);
		}
		for(int i = flag; i< mlist.length; i++) {
			attendlist[i] = "n";
			//log.info("수정된 " + mlist[i] + " 출석여부 : " + attendlist[i]);
		}
		
		//log.info("=======================");
		attendDto.setAttendlist(attendlist);
		attendDto.setCount(count);
		attendDto.setLno(lno);
		
		
		String strLno = Integer.toString(lno);
		attendService.modify(attendDto);
		return "redirect:/attend/view?lno=" + strLno ;
		// 객체를 따로 보내지 않으면 자동으로 앞 글자를 소문자로 해서 처리한다.
	}
	
	@GetMapping("/info")
    public @ResponseBody List<AttendDTO> list(){
		return attendService.getStudentList();
    }
	@GetMapping("/count/{mid}")
    public @ResponseBody Integer AttendCount(@PathVariable("mid") String mid){
		return attendService.getCount(mid);
    }
	
}
