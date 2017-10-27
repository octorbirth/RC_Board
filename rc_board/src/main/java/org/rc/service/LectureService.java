package org.rc.service;

import java.util.List;

import org.rc.dto.LectureDTO;

public interface LectureService {

	public List<LectureDTO> list();

	public void remove(int lno);

	public int getAmount();

}
