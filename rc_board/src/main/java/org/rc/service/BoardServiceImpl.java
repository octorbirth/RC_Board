package org.rc.service;

import java.util.List;

import javax.inject.Inject;
import org.rc.dto.BoardDTO;
import org.rc.dto.Criteria;
import org.rc.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.extern.java.Log;

@Service
@Log
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardMapper mapper;

	@Override
	public void register(BoardDTO dto) {
		mapper.insert(dto);
	}
	@Override
	public List<BoardDTO> list(Criteria cri) {
		cri.setTotal(mapper.getTotal(cri));

		return mapper.listPage(cri);
	}
	@Override
	public BoardDTO get(Long bno) {
		return mapper.findByBno(bno);
	}
	@Override
	public void modify(BoardDTO dto) {
		mapper.update(dto);

	}

	@Override
	public void remove(Long bno) {
		mapper.remove(bno);

	}

}
