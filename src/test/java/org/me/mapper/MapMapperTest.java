package org.me.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.me.domain.MapVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapMapperTest {

	@Autowired
	private MapMapper mapper;
	
	//@Test
	public void test() {
		
		MapVO vo = new MapVO();
		
		vo.setMap_Name("이름");
		vo.setMap_Email("이메일");
		vo.setBasic_Address("주소");
		vo.setMap_Title("제목");
		vo.setMap_Content("내용");
		
		mapper.mapInsert(vo);
		
		log.info(vo);
	}

}
