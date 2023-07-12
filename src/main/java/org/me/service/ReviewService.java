package org.me.service;

import java.util.List;

import org.me.domain.ReviewVO;

public interface ReviewService {

//	글등록
	public void insertBoard(ReviewVO board);
	
//	글수정
	public int modify(ReviewVO board);
	
//	글목록
	public List<ReviewVO> getList();
	
// 	글조회
	public ReviewVO getBoard(int bno);
	
//	글삭제
	public int deleteBoard(int bno);
}
