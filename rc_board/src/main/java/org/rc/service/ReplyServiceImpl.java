package org.rc.service;

import java.util.List;

import org.rc.dto.Criteria;
import org.rc.dto.ReplyDTO;
import org.rc.mapper.BoardMapper;
import org.rc.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper mapper;

	@Autowired
	private BoardMapper boardMapper;
	
	@Override
    public List<ReplyDTO> getListReply(ReplyDTO dto) {        
        return mapper.listReply(dto);
    }
	@Transactional
	@Override
	 public void reRegister(ReplyDTO dto) {
	 	boardMapper.upreplycnt(dto.getBno());
        mapper.reinsert(dto);
        mapper.reupdate();
	 }
	@Transactional
	@Override
	public void rereRegister(ReplyDTO dto) {
		boardMapper.upreplycnt(dto.getBno());
		mapper.rereinsert(dto);
	}
	@Transactional
	@Override
    public void remove(Long rno, Long bno) {
        mapper.delete(rno);  
        boardMapper.downreplycnt(bno);
    }
	@Override
    public void update(ReplyDTO dto) {
        mapper.update(dto);        
    }



}
