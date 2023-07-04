package org.me.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userAdd1;
	private String userAdd2;
	private int userBirth;
	private Date regDate;
	
	
}
