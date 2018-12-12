package com.swebchat.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.swebchat.member.model.dto.MemberDTO;

@Component
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate template;

	//회원등록
	public int insertMember(MemberDTO dto) {
		
		return template.insert("insertMember", dto);
		
	}
	
	//중복체크
	public int selectUserId(String id) {
		
		return template.selectOne("selectUserId", id);
		
	}
	
	//회원목록
	public List<MemberDTO> getMemberList(){
		
		return template.selectList("getMemberList");
	}
	
	//정보수정
	public int updateMember(MemberDTO dto) {
		
		return template.update("updateMember", dto);
	}
	
	//탈퇴
	public int deleteMember(MemberDTO dto) {
		
		return template.delete("deleteMember", dto);
	}

	public MemberDTO selectMember(MemberDTO dto) {
		
		return template.selectOne("selectMember", dto);
	}
	
}
