package org.me.service;

import javax.inject.Inject;

import org.me.dao.MemberDAO;
import org.me.domain.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO memberDAO;
	
	/*
	 * @Autowired MemberMapper mapper;
	 */
	
	//회원가입
	@Override
	public void join(MemberVO memberVO) {
		memberDAO.join(memberVO);
	}

	//로그인
	@Override
	public MemberVO memberLogin(MemberVO member) {
		return memberDAO.login(member);
	}

	//아이디 중복체크
	@Override
	public int idCheck(String userId) {
		return memberDAO.idCheck(userId);
		//return mapper.idCheck(userId);
	}

}
