package org.rc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.rc.dto.MemberDTO;
import org.rc.vo.MemberVO;

public interface MemberMapper {
	@Select("select * from tbl_member where mid = #{mid} and mpw = #{mpw}")
	public MemberVO findByID(MemberDTO dto);
	
	@Insert("insert into tbl_member (mid, mpw, mname, admin) values( #{mid}, #{mpw}, #{mname}, #{admin} )")
	public void createID(MemberDTO dto);
	
	@Select("select * from tbl_member where mid = #{mid}")
	public MemberVO getVO(MemberDTO dto);
	
	@Select("select * from tbl_member where admin = 'n'")
	public List<MemberVO> getMentee();

	@Select("select * from tbl_member where mid = #{mid}")
	public MemberVO getInfo(MemberDTO dto);

	@Update("update tbl_member set  image=#{image}, mname= #{mname}, stuid= #{stuid}, dept = #{dept}, phone = #{phone}, email = #{email}, mpw = #{mpw}  where mid = #{mid}")
	public void updateInfo(MemberDTO vo);
}
