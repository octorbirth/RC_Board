package org.rc.service;

import java.util.List;

import org.rc.dto.Criteria;
import org.rc.dto.ReplyDTO;

public interface ReplyService {
	
	public List<ReplyDTO> getListReply(ReplyDTO dto);
	public void reRegister(ReplyDTO dto);
	public void reUpdate();
}
