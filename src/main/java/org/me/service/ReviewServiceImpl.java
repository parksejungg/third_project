package org.me.service;

import org.me.domain.ReviewVO;
import org.me.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {

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

	
	
}
