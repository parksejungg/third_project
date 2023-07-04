package org.me.service;

import javax.inject.Inject;

import org.me.dao.MemberDAO;
import org.me.domain.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	@Override
	public void register(MemberVO memberVO) {
		memberDAO.register(memberVO);
	}


}
