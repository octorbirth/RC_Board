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



}
