package org.rc.service;

import java.util.List;

import javax.inject.Inject;

import org.rc.dto.LectureDTO;
import org.rc.mapper.LectureMapper;
import org.springframework.stereotype.Service;

import lombok.extern.java.Log;
@Service
@Log
public class LectureServiceImpl implements LectureService {

	@Inject
	private LectureMapper mapper;
	
	@Override
	public List<LectureDTO> list() {
		
		return mapper.list();
	}

}
