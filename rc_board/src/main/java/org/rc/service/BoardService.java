package org.rc.service;

import java.util.List;

import org.rc.dto.BoardDTO;
import org.rc.dto.Criteria;
import org.rc.dto.SearchCriteria;

public interface BoardService {
	public void register(BoardDTO dto);
	public List<BoardDTO> list(SearchCriteria cri);
	public BoardDTO get(Long bno);
	public void remove(Long bno);
	public void modify(BoardDTO dto);
	public List<String> getFileList(Long bno);
	public void deleteFiles(Long bno);
	public void viewcntUp(Long bno);
}
