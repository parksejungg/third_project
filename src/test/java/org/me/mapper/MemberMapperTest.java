package org.me.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.me.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class MemberMapperTest {

	@Autowired
	private MemberMapper mapper;

	@Test
	public void testLogin() {
		MemberVO member = new MemberVO();
		
		member.setUserId("zzang5");
		member.setUserPw("1234");
		
		mapper.login(member);
		log.info("결과 값 : "+mapper.login(member));
	}

}
