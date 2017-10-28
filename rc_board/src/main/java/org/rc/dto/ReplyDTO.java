package org.rc.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	private Long rno, gno, bno;
    private String reply, replyer;
    private Date replydate;
    private String garbage;

    private String mname;
    private String image;
}

//create table tbl_reply(
//	    rno int auto_increment primary key,
//	    gno int not null,
//	    bno int not null,
//	    reply varchar(100) not null,
//	    replyer varchar(50) not null,
//	    replydate timestamp default now()
//	);


//ALTER TABLE tbl_reply ADD garbage char(1) default 'n' ;