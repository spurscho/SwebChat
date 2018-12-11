package com.swebchat.member.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString
public class MemberDTO {
	
	private String id;
	private String pwd;
	
	public MemberDTO() {}
		
}