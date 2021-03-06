package org.rc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.rc.dto.BoardDTO;
import org.rc.dto.Criteria;
import org.rc.dto.ReplyDTO;

public interface ReplyMapper {
	
	public List<ReplyDTO> listReply(ReplyDTO dto);
	
	@Insert ("insert into tbl_reply (reply, replyer, gno, bno) values (#{reply}, #{replyer}, LAST_INSERT_ID(), #{bno})" )
    public void reinsert(ReplyDTO dto);
	
	@Update ("update tbl_reply set gno=last_insert_id() where rno = last_insert_id()")
	public void reupdate();

	@Insert ("insert into tbl_reply (reply, replyer, gno, bno) values (#{reply}, #{replyer}, #{gno}, #{bno})" )
	public void rereinsert(ReplyDTO dto);
	
//	@Delete("delete from tbl_reply where rno = #{rno}")
//    public void delete(Integer rno);

	@Update("update tbl_reply set reply='삭제된 댓글 입니다.', garbage='y' where rno = #{rno}")
	  public void delete(Long rno);
	
	
	@Update("update tbl_reply set reply=#{reply} where rno= #{rno}")
    public void update(ReplyDTO dto);

	
}
