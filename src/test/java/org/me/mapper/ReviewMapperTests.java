package org.me.mapper;

import static org.junit.Assert.*;

import java.util.Date;

import org.apache.log4j.spi.LoggerFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.me.domain.ReviewVO;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReviewMapperTests {

	
	@Autowired
	private ReviewMapper mapper;
	
	
	@Test
	public void InsertBoard() {
		
		 ReviewVO vo = new ReviewVO();
		         
	         vo.setTitle("안뇽 제목입니당");
	         vo.setContent("안뇽 내용임돵");
	         vo.setWriter("내가 썼다 마!");
	         
	         
	         mapper.insertBoard(vo);
	}

}
