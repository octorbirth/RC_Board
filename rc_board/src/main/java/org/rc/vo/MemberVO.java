package org.rc.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
	private String mid, mpw, mname;
	private String admin;
	private String dept, stuid, ban, phone, email, image;
	private Date regdate;
}

//create table tbl_member (
//	    mid varchar(50) not null primary key,    
//	    mpw varchar(50) not null,
//	    mname varchar(50) not null,
//	    admin varchar(1) not null,
//	    dept varchar(50),
//	    stuid varchar(10),
//	    ban varchar(10),
//	    phone varchar(20),
//	    email varchar(20),
//	    image varchar(50),
//	    regdate timestamp default now()
//	);
