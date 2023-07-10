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
public class ReviewMapperTests {

	@Autowired
	private ReviewMapper mapper;
	
	
	//@Test
		public void InsertBoard() {
			
			 ReviewVO vo = new ReviewVO();
			         
		         vo.setTitle("안뇽 제목입니당");
		         vo.setContent("안뇽 내용임돵");
		         vo.setWriter("내가 썼다 마!");
		         
		         
		         mapper.insertBoard(vo);
		}
		
	
	
	@Test
	public void testModify() {
		ReviewVO board = new ReviewVO();
		
		board.setBno(6);
		board.setTitle("제목수정2번째!");
		board.setContent("내용수정2번쨰!");
		
		int result = mapper.modify(board);
		System.out.println("게시글 수정 " + result);
	
	}

}
