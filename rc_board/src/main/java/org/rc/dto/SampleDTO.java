package org.rc.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class SampleDTO {
	private Long bno;
	private String title;
	private Date regdate;
}
