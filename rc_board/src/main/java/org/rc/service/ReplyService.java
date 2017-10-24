package org.rc.service;

import java.util.List;

import org.rc.dto.Criteria;
import org.rc.dto.ReplyDTO;

public interface ReplyService {
	
	public List<ReplyDTO> getListReply(ReplyDTO dto);
	public void reRegister(ReplyDTO dto);
	public void rereRegister(ReplyDTO dto);
	public void remove(Long rno, Long bno);
	public void update(ReplyDTO dto);
}
