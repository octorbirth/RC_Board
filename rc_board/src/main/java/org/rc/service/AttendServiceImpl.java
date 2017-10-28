package org.rc.service;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.rc.dto.AttendDTO;
import org.rc.dto.MemberDTO;
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
		String []attendlist = dto.getAttendlist();
		String []namelist = dto.getNamelist();
		for (int i = 0; i < mlist.length; i++) {
			mapper.create(mlist[i], attendlist[i], namelist[i]);
		}
	}

	@Override
	public List<AttendDTO> getView(Integer lno) {
		
		return mapper.getView(lno);
	}

	@Override
	public void modify(AttendDTO dto) {
		lectureMapper.updateAmount(dto.getCount(), dto.getLno());
		mapper.deleteAttend(dto.getLno());
		String []mlist = dto.getMlist();
		String []attendlist = dto.getAttendlist();
		String []namelist = dto.getNamelist();
		for (int i = 0; i < mlist.length; i++) {
			mapper.updateAttend(dto.getLno() ,mlist[i], attendlist[i], namelist[i]);
		}
		
		return;
	}

	@Override
	public List<AttendDTO> getStudentList() {
		
		return mapper.getStudentInfo();
	}

	@Override
	public Integer getCount(String mid) {
		
		return mapper.getCount(mid);
	}
}
