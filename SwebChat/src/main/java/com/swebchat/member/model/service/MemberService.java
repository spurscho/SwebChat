package com.swebchat.member.model.service;

import java.util.List;

import com.swebchat.member.model.dto.MemberDTO;

public interface MemberService {
	
	int insertMember(MemberDTO dto);
	int updateMember(String id);
	int deleteMember(String id);
	
}
