package org.rc.service;

import java.util.List;

import org.rc.dto.BoardDTO;
import org.rc.dto.Criteria;

public interface BoardService {
	public void register(BoardDTO dto);
	public List<BoardDTO> list(Criteria cri);
}
