package org.rc.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AttendDTO {
	private int lno;
	private int count;
	private String mname;
	private String mid;
	private String attend;
	private String[] mlist;
	private String[] namelist;
	private String[] attendlist;
	private Date regdate;
}
