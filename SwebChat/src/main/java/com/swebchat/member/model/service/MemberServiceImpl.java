package com.swebchat.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.swebchat.member.model.dao.MemberDAO;
import com.swebchat.member.model.dto.MemberDTO;

@Component
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberdao;
	
	@Override
	public int insertMember(MemberDTO dto) {
		
		return memberdao.insertMember(dto);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		
		return memberdao.getMemberList();
	}

	@Override
	public int updateMember(String id) {
		
		return memberdao.updateMember(id);
	}

	@Override
	public int deleteMember(String id) {
		
		return memberdao.deleteMember(id);
	}
	
}
