package org.rc.service;

import java.util.List;

import org.rc.dto.Criteria;
import org.rc.dto.ReplyDTO;
import org.rc.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;

	@Override
    public List<ReplyDTO> getListReply(ReplyDTO dto) {        
        return mapper.listReply(dto);
    }

	 @Override
	 public void reRegister(ReplyDTO dto) {
	        mapper.reinsert(dto);
	 }
	 @Override
	 public void reUpdate() {
	        mapper.reupdate();
	 }

	@Override
	public void rereRegister(ReplyDTO dto) {
			mapper.rereinsert(dto);
	}
	
	@Override
    public void remove(Integer rno) {
        mapper.delete(rno);  
    }
	@Override
    public void update(ReplyDTO dto) {
        mapper.update(dto);        
    }





}
