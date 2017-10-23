package org.rc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.rc.dto.BoardDTO;
import org.rc.dto.Criteria;

public interface BoardMapper {

	@Insert("insert into tbl_board (title, contents, writer, isfile, isimg) values (#{title}, #{contents}, #{writer}, #{isfile}, #{isimg})")
	public void insert(BoardDTO dto);

	public List<BoardDTO> listPage(Criteria Cri);
	
	@Select("select count(*) from tbl_board where bno > 0")
	public int getTotal(Criteria cri);
	
	@Select("select * from tbl_board where bno = #{bno}")
	public BoardDTO findByBno(Long bno);
	
	@Update("update tbl_board set title = #{title}, contents= #{contents}, isimg = #{isimg}, isfile = #{isfile}  where bno = #{bno}")
	public void update(BoardDTO dto);
	
	@Delete("delete from tbl_board where bno = #{bno}")
	public void remove(Long bno);
}
