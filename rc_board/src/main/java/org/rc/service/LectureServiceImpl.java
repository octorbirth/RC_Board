package org.rc.service;

import java.util.List;

import javax.inject.Inject;

import org.rc.dto.LectureDTO;
import org.rc.mapper.AttendMapper;
import org.rc.mapper.LectureMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;
@Service
@Log
public class LectureServiceImpl implements LectureService {

	@Inject
	private LectureMapper mapper;
	
	@Inject
	private AttendMapper attendMapper;
	
	
	@Override
	public List<LectureDTO> list() {
		
		return mapper.list();
	}

	@Transactional
	@Override
	public void remove(int lno) {
		attendMapper.deleteAttend(lno);
		mapper.remove(lno);
	}

	@Override
	public int getAmount() {
		
		return mapper.getAmount();
	}

}
