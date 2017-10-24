package org.rc.service;

import javax.inject.Inject;

import org.rc.dto.MemberDTO;
import org.rc.mapper.MemberMapper;
import org.rc.vo.MemberVO;
import org.springframework.stereotype.Service;

import lombok.extern.java.Log;

@Service
@Log
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberMapper mapper;

	@Override
	public MemberVO login(MemberDTO dto) {
		return mapper.findByID(dto);
	}

	@Override
	public void create(MemberDTO dto) {
		mapper.createID(dto);
		return;
	}
	
	
	
}
