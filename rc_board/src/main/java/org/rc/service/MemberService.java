package org.rc.service;

import java.util.List;

import org.rc.dto.MemberDTO;
import org.rc.vo.MemberVO;

public interface MemberService {
	public MemberVO login(MemberDTO dto);
	public void create(MemberDTO dto);
	public MemberVO autoLogin(MemberDTO dto);
	public List<MemberVO> getList();
	public MemberVO getInfo(MemberDTO dto);
	public void updateInfo(MemberDTO dto);
}
