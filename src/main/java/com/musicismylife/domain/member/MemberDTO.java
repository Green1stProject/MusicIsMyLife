package com.musicismylife.domain.member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class MemberDTO {

	private String member_id;
	private String member_pw;
	private String member_nickname;
	private String member_email;
	private String created_at;
	private String updated_at;
	
}