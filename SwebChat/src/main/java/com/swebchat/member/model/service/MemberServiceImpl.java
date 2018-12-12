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
	public int updateMember(MemberDTO dto) {
		
		return memberdao.updateMember(dto);
	}

	@Override
	public int deleteMember(MemberDTO dto) {
		
		return memberdao.deleteMember(dto);
	}

	@Override
	public int selectUserId(String id) {
		
		return memberdao.selectUserId(id);
	}
	
	@Override
	public MemberDTO loginMember(MemberDTO dto) {
		return memberdao.selectMember(dto);
	}

}
