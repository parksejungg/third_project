package org.me.service;

import org.me.domain.MemberVO;

public interface MemberService {

	public void register(MemberVO memberVO);
	
	public MemberVO memberLogin(MemberVO member);
	
}
