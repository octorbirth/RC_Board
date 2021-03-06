package org.rc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.rc.dto.LectureDTO;

public interface LectureMapper {

	@Insert("insert into tbl_lecture (amount) values (#{amount})")
	public void create(int amount);

	@Select("select * from tbl_lecture order by lno desc")
	public List<LectureDTO> list();

	@Delete("delete from tbl_lecture where lno = #{lno}")
	public void remove(int lno);

	@Update("update tbl_lecture set amount = #{amount} where lno = #{lno}")
	public void updateAmount(@Param("amount") int amount,@Param("lno") int lno);

	@Select("select count(*) from tbl_lecture")
	public int getAmount();

}
