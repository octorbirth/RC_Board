package org.rc.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.rc.dto.BoardDTO;
import org.rc.dto.Criteria;
import org.rc.dto.SearchCriteria;
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
	public void register(BoardDTO dto) {
		mapper.insert(dto);
		String[] ufiles = dto.getUfile();
		if(ufiles != null) {
			Arrays.stream(ufiles).forEach((fname)->{
				attachMapper.insert(fname);
			});
		}
			
	}
	@Override
	public List<BoardDTO> list(SearchCriteria cri) {
		cri.setTotal(mapper.getTotal(cri));

		return mapper.listSearch(cri);
	}
	@Override
	public BoardDTO get(Long bno) {
		return mapper.findByBno(bno);
	}
	@Override
	public void modify(BoardDTO dto) {
		mapper.update(dto);
		String[] ufiles = dto.getUfile();
		
		Long bno = dto.getBno();
		if(ufiles != null) {
			Arrays.stream(ufiles).forEach((fname)->{
				
				attachMapper.modInsert(fname, bno);
			});
		}
	}

	@Override
	public void remove(Long bno) {
		attachMapper.deletefiles(bno);
		mapper.remove(bno);
	}
	@Override
	public List<String> getFileList(Long bno) {
		
		return attachMapper.getfiles(bno);
	}
	@Override
	public void deleteFiles(Long bno) {
		attachMapper.deletefiles(bno);
	}
}
