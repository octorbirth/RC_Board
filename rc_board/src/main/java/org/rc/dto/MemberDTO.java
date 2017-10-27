package org.rc.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private String mid, mpw, mname;
	private String admin;
	private String dept, stuid, ban, phone, email, image;
	private Date regdate;
	private String[] mlist;
	private String[] alist;
	private String[] namelist;
}
