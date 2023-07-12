package org.me.service;

import org.me.domain.MemberVO;

public interface MemberService {

	//회원가입
	public void join(MemberVO memberVO);
	
	//로그인
	public MemberVO memberLogin(MemberVO member);
	
	//아이디 중복검사
	int idCheck(String userId);
	
}
