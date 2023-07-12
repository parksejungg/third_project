package org.me.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.me.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTest {

	@Autowired
	private MemberMapper mapper;
	
	@Test 
	public void testJoin() {
		MemberVO member = new MemberVO();
		
		member.setUserId("test2");
		member.setUserPw("123");
		member.setUserName("테스트");
		member.setUserAddr1("테스트1");
		member.setUserAddr2("테스트2");
		member.setUserBirth(230712);
		
		mapper.join(member);
		
	}
	
	//@Test
	public void testLogin() {
		MemberVO member = new MemberVO();
		
		member.setUserId("test1");
		member.setUserPw("123");
		
		mapper.login(member);
		log.info("결과 값 : "+mapper.login(member));
	}
	
	//@Test
	public void testIdCheck() {
		String id ="ffff";
		String id2="mansil";
		
		mapper.idCheck(id);
		mapper.idCheck(id2);
		
	}

}
