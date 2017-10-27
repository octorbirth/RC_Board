package org.rc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.rc.dto.LectureDTO;

public interface LectureMapper {

	@Insert("insert into tbl_lecture (amount) values (#{amount})")
	public void create(int amount);

	@Select("select * from tbl_lecture order by lno desc")
	public List<LectureDTO> list();

}
