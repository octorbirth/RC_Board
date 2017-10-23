package org.rc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface AttachMapper {

	@Insert("insert into tbl_file (fname, bno) values (#{fname}, #{bno})")
	public void modInsert(@Param("fname") String fname, @Param("bno") Long bno);
	
	@Insert("insert into tbl_file (fname, bno) values (#{fname}, LAST_INSERT_ID() )")
	public void insert(String fname);
	
	@Select("select * from tbl_file where bno = #{bno}")
	public List<String> getfiles(Long bno);
	
	@Delete("delete from tbl_file where bno = #{bno}")
	public void deletefiles(Long bno);
}
