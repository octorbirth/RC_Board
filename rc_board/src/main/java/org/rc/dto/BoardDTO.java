package org.rc.dto;


import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private Long bno;
	private String title;
	private String contents;
	private String writer;
	private Long replycnt;
	private Long viewcnt;
	private Date regdate;
	private Date updateddate;
	private String[] ufile;
	private String isfile;
	private String isimg;
}

//create table tbl_board (
//	    bno int auto_increment primary key,    
//	    title varchar(50) not null,
//	    contents varchar(200) not null,
//	    writer varchar(50) not null,
//	    replycnt int default 0,
//	    regdate timestamp default now(),
//	    updateddate timestamp default now()
//	);

//ALTER TABLE tbl_board ADD isfile char(1) default 'n' ;
//ALTER TABLE tbl_board ADD isimg char(1) default 'n' ;