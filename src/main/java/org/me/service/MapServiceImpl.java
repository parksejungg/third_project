package org.me.service;

import org.me.domain.MapVO;
import org.me.mapper.MapMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MapServiceImpl implements MapService{
	
	@Autowired
	private MapMapper mapper;
	
	@Override
	public void mapInsert(MapVO vo) {
		mapper.mapInsert(vo);
	}

	
}
