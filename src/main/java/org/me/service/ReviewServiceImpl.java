package org.me.service;

import org.me.domain.ReviewVO;
import org.me.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
	
	@Override
	public void insertBoard(ReviewVO board) {
		mapper.insertBoard(board);
		
	}

	
	
}
