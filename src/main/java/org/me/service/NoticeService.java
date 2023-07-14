package org.me.service;

import java.util.List;

import org.me.domain.NoticeVO;

public interface NoticeService {

//	글등록
	public void insertNotice(NoticeVO board);
	
//	글수정
	public int modify(NoticeVO board);
	
//	글목록
	public List<NoticeVO> getList();
	
// 	글조회
	public NoticeVO getNotice(int bno);
	
//	글삭제
	public int deleteNotice(int bno);
}
