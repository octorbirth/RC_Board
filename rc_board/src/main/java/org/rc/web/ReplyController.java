package org.rc.web;

import java.util.List;

import org.rc.dto.Criteria;
import org.rc.dto.ReplyDTO;
import org.rc.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/reply/*")
@Log
public class ReplyController {
	
	@Autowired
    private ReplyService service;

	@GetMapping("/list/{bno}")
    public List<ReplyDTO> list(@PathVariable("bno") Long bno){
		ReplyDTO dto = new ReplyDTO();
		dto.setBno(bno);
		return service.getListReply(dto);
    }
	
	@PostMapping("/new")
    public void addReply(@RequestBody ReplyDTO dto) {
		service.reRegister(dto);
    }
	@PostMapping("/renew")
    public void addreReply(@RequestBody ReplyDTO dto) {

		service.rereRegister(dto);
		
    }
	
	@DeleteMapping("/{rno}")
    public ResponseEntity<String> removeReply(@PathVariable("rno") Long rno, @RequestBody ReplyDTO dto){
        // 결과값을 보여주기 위해서 responseEntity를 이용
        service.remove(rno, dto.getBno());
        return new ResponseEntity<String>("removed",HttpStatus.OK);
    }

	@PutMapping("/{rno}")
    public ResponseEntity<String> updateReply(@PathVariable("rno") Long rno, @RequestBody ReplyDTO dto){
        dto.setRno(rno);
        log.info("Update rno: " + rno);
        service.update(dto);
        return new ResponseEntity<String>("update",HttpStatus.OK);
    }





}
