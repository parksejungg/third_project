package org.me.mapper;

import org.me.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void join(MemberVO member);
	
	//로그인
	public MemberVO login(MemberVO member);
	
	//아이디 중복검사
	public int idCheck(String userId);

	
}
