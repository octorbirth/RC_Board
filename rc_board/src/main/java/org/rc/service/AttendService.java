package org.rc.service;

import java.util.List;

import org.rc.dto.AttendDTO;

public interface AttendService {

	public void create(AttendDTO dto);

	public List<AttendDTO> getView(Integer lno);

}
