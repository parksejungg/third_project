package org.me.domain.relay.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CommentDto {

	private int rno;     
	
	private int bno;     
	
    private String reply;   
    
    private String userId;
    
    private String username;
    
    private String replydate;      
    
    private String updatedate;       
    
}