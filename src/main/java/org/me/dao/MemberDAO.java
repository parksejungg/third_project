package org.me.dao;

import org.me.domain.MemberVO;

public interface MemberDAO {

	public void join(MemberVO memberVO);
	
	public MemberVO login(MemberVO memberVO);
	
	//아이디 중복검사
	public int idCheck(String userId);
}