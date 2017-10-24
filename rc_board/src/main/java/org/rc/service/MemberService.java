package org.rc.service;

import org.rc.dto.MemberDTO;
import org.rc.vo.MemberVO;

public interface MemberService {
	public MemberVO login(MemberDTO dto);
	public void create(MemberDTO dto);
	public MemberVO autoLogin(MemberDTO dto);
}
