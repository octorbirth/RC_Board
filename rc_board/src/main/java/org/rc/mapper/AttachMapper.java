package org.rc.mapper;

import org.apache.ibatis.annotations.Insert;

public interface AttachMapper {

	@Insert("insert into tbl_file (fname, bno) values (#{fname}, LAST_INSERT_ID() )")
	public void insert(String fname);
	
}
