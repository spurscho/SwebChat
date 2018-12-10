package com.swebchat.member.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.swebchat.member.model.dto.MemberDTO;

@Service
public interface MemberService {
	
	int insertMember(MemberDTO dto);
	
	List<MemberDTO> getMemberList();
	
	int updateMember(String id);
	
	int deleteMember(String id);
	
}
