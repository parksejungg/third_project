package org.me.mapper;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.me.domain.NoticeVO;
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
	
	//글 등록
	//@Test
	public void insertNotice() {
		
		 NoticeVO vo = new NoticeVO();
		         
         vo.setTitle("공지사항");
         vo.setContent("다들 나가십쇼");
         vo.setWriter("관리자");
         
         mapper.insertNotice(vo);
	}
	
	//글 목록
	//@Test
	public void testGetList() {

		List<NoticeVO> list = mapper.getList();
		for(int i = 0; i<list.size();i++) {
			log.info("" + list.get(i));
		}
	}
	
	//글 조회
	//@Test
	public void testGetNotice() {
		
		int bno = 2;
		log.info("조회 번호는 8의 내용 "+mapper.getNotice(bno));
	}
	
	//글 수정
	//@Test
	public void testModify() {
		
		NoticeVO vo = new NoticeVO();
		vo.setBno(2);
		vo.setTitle("수정 공지");
		vo.setContent("수정 공지 내용");
		
		int result = mapper.modify(vo);
		log.info("수정되면 1, 아니면 0 :" + result);
	}
	
	//글 삭제
	@Test
	public void testDelet() {
		int result = mapper.deleteNotice(23);
		log.info("지워지면 1, 아니면 0 :"+result);
		
	}
	
}
