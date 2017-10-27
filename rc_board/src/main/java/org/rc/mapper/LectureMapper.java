package org.rc.mapper;

import org.apache.ibatis.annotations.Insert;

public interface LectureMapper {

	@Insert("insert into tbl_lecture (amount) values (#{amount})")
	public void create(int amount);

}
