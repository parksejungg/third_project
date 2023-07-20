package org.me.service;

import java.util.List;

import org.me.domain.NoticeVO;
import org.me.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
	
	//글등록
	@Override
	public void insertNotice(NoticeVO board) {
		mapper.insertNotice(board);
	}

	//글 수정
	@Override
	public int modify(NoticeVO board) {
		return mapper.modify(board);
	}
	
	// 글목록
	@Override
	public List<NoticeVO> getList() {
		return mapper.getList();
	}	

	//글조회
	@Override
	public NoticeVO getNotice(int bno) {
		return mapper.getNotice(bno);
	}

	//글삭제
	@Override
	public int deleteNotice(int bno) {
		return mapper.deleteNotice(bno);
	}

	
	
}
