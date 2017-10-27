package org.rc.service;

import java.util.Arrays;

import javax.inject.Inject;

import org.rc.dto.AttendDTO;
import org.rc.mapper.AttendMapper;
import org.rc.mapper.BoardMapper;
import org.rc.mapper.LectureMapper;
import org.springframework.stereotype.Service;

import lombok.extern.java.Log;

@Service
@Log
public class AttendServiceImpl implements AttendService {
	@Inject
	private AttendMapper mapper;

	@Inject
	private LectureMapper lectureMapper;
	
	@Override
	public void create(AttendDTO dto) {
		lectureMapper.create(dto.getCount());
		String []mlist = dto.getMlist();
		String []attend = dto.getAttend();
		String []namelist = dto.getNamelist();
		for (int i = 0; i < mlist.length; i++) {
			mapper.create(mlist[i], attend[i], namelist[i]);
		}
	}
}
