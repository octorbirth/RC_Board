package org.rc.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface AttendMapper {

	@Insert("insert into tbl_attend (lno, mid, attend, mname) values (LAST_INSERT_ID(),  #{mid}, #{attend}, #{mname})")
	public void create(@Param("mid") String mid, @Param("attend") String attend, @Param("mname") String mname );
}
