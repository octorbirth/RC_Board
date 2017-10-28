package org.rc.service;

import java.util.List;

import org.rc.dto.AttendDTO;
import org.rc.dto.MemberDTO;

public interface AttendService {

	public void create(AttendDTO dto);

	public List<AttendDTO> getView(Integer lno);

	public void modify(AttendDTO dto);

	public List<AttendDTO> getStudentList();

	public Integer getCount(String mid);

}
