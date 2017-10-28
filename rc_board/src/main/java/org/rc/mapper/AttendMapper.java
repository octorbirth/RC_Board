package org.rc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.rc.dto.AttendDTO;
import org.rc.dto.MemberDTO;

public interface AttendMapper {

	@Insert("insert into tbl_attend (lno, mid, attend, mname) values (LAST_INSERT_ID(),  #{mid}, #{attend}, #{mname})")
	public void create(@Param("mid") String mid, @Param("attend") String attend, @Param("mname") String mname );

	@Select("select * from tbl_attend where lno = #{lno}")
	public List<AttendDTO> getView(Integer lno);

	@Delete("delete from tbl_attend where lno = #{lno}")
	public void deleteAttend(int lno);

	@Insert("insert into tbl_attend (lno, mid, attend, mname) values (#{lno}, #{mid}, #{attend}, #{mname})")
	public void updateAttend(@Param("lno") int lno, @Param("mid") String mid, @Param("attend") String attend, @Param("mname") String mname);

	public List<AttendDTO> getStudentInfo();

	@Update("update tbl_attend set mname = #{mname} where mid = #{mid}")
	public void updateInfo(MemberDTO dto);

	@Select("select count(*) from tbl_attend where mid = #{mid} and attend = 'y'")
	public Integer getCount(String mid);
}
