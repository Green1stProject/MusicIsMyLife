package com.musicismylife.domain.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {

	void insertMember(MemberDTO memberDTO);

	MemberDTO login(String member_id, String member_pw);

	MemberDTO getMember(MemberDTO memberDTO);




}
