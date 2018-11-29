package com.swebchat.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}

	// 한 개의 데이터 조회
	public MemberDTO getMemberData(String id) {

		MemberDTO dto = sessionTemplate.selectOne("MemberMapper.selectMember", id);
		return dto;
		
	}
}
