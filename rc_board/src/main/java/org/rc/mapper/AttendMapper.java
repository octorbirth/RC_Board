package org.rc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.rc.dto.AttendDTO;

public interface AttendMapper {

	@Insert("insert into tbl_attend (lno, mid, attend, mname) values (LAST_INSERT_ID(),  #{mid}, #{attend}, #{mname})")
	public void create(@Param("mid") String mid, @Param("attend") String attend, @Param("mname") String mname );

	@Select("select * from tbl_attend where lno = #{lno}")
	public List<AttendDTO> getView(Integer lno);

	@Delete("delete from tbl_attend where lno = #{lno}")
	public void deleteAttend(int lno);
}
