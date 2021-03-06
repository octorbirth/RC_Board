package org.rc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.rc.dto.BoardDTO;
import org.rc.dto.Criteria;
import org.rc.dto.SearchCriteria;

public interface BoardMapper {

	@Insert("insert into tbl_board (title, contents, writer, isfile, isimg) values (#{title}, #{contents}, #{writer}, #{isfile}, #{isimg})")
	public void insert(BoardDTO dto);

	public List<BoardDTO> listSearch(SearchCriteria Cri);
	
	
	public int getTotal(SearchCriteria cri);
	
	@Select("select * from tbl_board where bno = #{bno}")
	public BoardDTO findByBno(Long bno);
	
	@Update("update tbl_board set title = #{title}, contents= #{contents}, isimg = #{isimg}, isfile = #{isfile}  where bno = #{bno}")
	public void update(BoardDTO dto);
	
	@Delete("delete from tbl_board where bno = #{bno}")
	public void remove(Long bno);

	@Update("update tbl_board set replycnt = replycnt+1 where bno = #{bno}")
	public void upreplycnt(Long bno);

	@Update("update tbl_board set replycnt = replycnt-1 where bno = #{bno}")
	public void downreplycnt(Long bno);
	
	@Update("update tbl_board set viewcnt = viewcnt+1 where bno = #{bno}")
	public void viewcntUp(Long bno);
}
