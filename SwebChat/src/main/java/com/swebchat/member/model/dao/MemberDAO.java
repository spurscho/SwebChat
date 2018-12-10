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
	
	//회원목록
	public List<MemberDTO> getMemberList(){
		
		return template.selectList("getMemberList");
	}
	
	//정보수정
	public int updateMember(String id) {
		
		return template.update("updateMember", id);
	}
	
	//탈퇴
	public int deleteMember(String id) {
		
		return template.delete("deleteMember", id);
	}
	
}
