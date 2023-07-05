package org.me.dao;

import org.me.domain.MemberVO;

public interface MemberDAO {

	public void register(MemberVO memberVO);
	
	public MemberVO login(MemberVO memberVO);
}
