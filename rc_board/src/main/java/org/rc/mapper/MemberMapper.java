package org.rc.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.rc.dto.MemberDTO;
import org.rc.vo.MemberVO;

public interface MemberMapper {
	@Select("select * from tbl_member where mid = #{mid} and mpw = #{mpw}")
	public MemberVO findByID(MemberDTO dto);
	
	@Insert("insert into tbl_member (mid, mpw, mname) values(#{mid},#{mpw}, #{mname})")
	public void createID(MemberDTO dto);
	
	@Select("select * from tbl_member where mid = #{mid}")
	public MemberVO getVO(MemberDTO dto);
}
