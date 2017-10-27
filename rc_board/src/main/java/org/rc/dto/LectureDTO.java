package org.rc.dto;

import java.util.Date;

import lombok.Data;

@Data
public class LectureDTO {
	private int lno;
	private int amount;
	private Date regdate;
}
