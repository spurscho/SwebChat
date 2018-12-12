package com.swebchat.member.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.swebchat.member.model.dto.MemberDTO;

@Service
public interface MemberService {
	
	int insertMember(MemberDTO dto);
	
	int selectUserId(String id);
	
	List<MemberDTO> getMemberList();
	
	int updateMember(MemberDTO dto);
	
	int deleteMember(MemberDTO dto);

	MemberDTO loginMember(MemberDTO dto);
	
}
