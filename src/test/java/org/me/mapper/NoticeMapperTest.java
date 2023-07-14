package org.me.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.me.domain.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class NoticeMapperTest {

	@Autowired
	private NoticeMapper mapper;
	
	@Test
	public void insertBoard() {
		
		 ReviewVO vo = new ReviewVO();
		         
         vo.setTitle("공지사항");
         vo.setContent("다들 나가십쇼");
         vo.setWriter("관리자");
         
         mapper.insertBoard(vo);
	}
}
