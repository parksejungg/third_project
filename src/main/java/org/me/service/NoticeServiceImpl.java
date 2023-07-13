package org.me.service;

import java.util.List;

import org.me.domain.ReviewVO;
import org.me.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private ReviewMapper mapper;
	
	
	// 글등록
	@Override
	public void insertBoard(ReviewVO board) {
		mapper.insertBoard(board);
		
	}

	// 글수정
	@Override
	public int modify(ReviewVO board) {
		return mapper.modify(board);
	}

	// 글목록
	@Override
	public List<ReviewVO> getList() {
		
		return mapper.getList();
	}

	// 글조회
	@Override
	public ReviewVO getBoard(int bno) {
		return mapper.getBoard(bno);
	}

	// 글삭제
	@Override
	public int deleteBoard(int bno) {
		return mapper.deleteBoard(bno);
	}

	
	
}
