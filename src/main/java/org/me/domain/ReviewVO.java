package org.me.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	
	 	private int bno;
	    private String title;
	    private String content;
	    private String writer;
	    private Date regdate;
	    private Date updatedate;
	
	
}
