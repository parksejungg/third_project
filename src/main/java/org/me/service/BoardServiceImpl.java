package org.me.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.me.dao.BoardDAO;
import org.me.vo.BoardVo;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardDAO boardDao;

	// 01. �Խñ۾���
	@Override
	public void create(BoardVo vo) {
		boardDao.create(vo);
	}

	// 02. �Խñ� �󼼺���
	@Override
	public BoardVo read(int bno) {
		
		return boardDao.read(bno);
	}

	// 03. �Խñ� ����
	@Override
	public void update(BoardVo vo) {
		boardDao.update(vo);
	}

	// 04. �Խñ� ����
	@Override
	public void delete(int bno) {
		boardDao.delete(bno);
	}

	// 05. �Խñ� ��ü ���
	@Override
	public List<BoardVo> listAll() {
		List<BoardVo> boardVo = boardDao.listAll();

		return boardVo;
	}

}
