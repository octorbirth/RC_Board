package org.rc.mapper;

import org.apache.ibatis.annotations.Insert;
import org.rc.dto.SampleDTO;

public interface SampleMapper {

	@Insert("insert into tbl_sample (title) values(#{title})")
    public void insert(SampleDTO dto);

}
