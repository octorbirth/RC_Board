package org.rc.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AttendDTO {
	private int lno;
	private int count;
	private String[] mlist;
	private String[] namelist;
	private String[] attend;
	private Date regdate;
}
