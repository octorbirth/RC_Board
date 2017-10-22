package org.rc.service;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import org.rc.dto.BoardDTO;
import org.rc.dto.Criteria;
import org.rc.mapper.AttachMapper;
import org.rc.mapper.BoardMapper;
import org.springframework.stereotype.Service;



import lombok.extern.java.Log;

@Service
@Log
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardMapper mapper;

	@Inject
	private AttachMapper attachMapper;
	
	@Override
	public void register(BoardDTO dto, String[] ufiles) {
		mapper.insert(dto);
		Arrays.stream(ufiles).forEach((fname)->{
			attachMapper.insert(fname);
		});
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
