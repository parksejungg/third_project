package org.me.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.me.domain.MemberVO;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberDAOImpl implements MemberDAO {

	private static SqlSessionFactory sqlMapper;
	
	
	private static SqlSessionFactory getInstane() {
		
			if(sqlMapper == null) {
				String resource = "mybatis-config.xml";
				
				try {
					Reader reader = Resources.getResourceAsReader(resource);
					sqlMapper = new SqlSessionFactoryBuilder().build(reader);
					reader.close();					
				} catch (Exception e) {
					e.printStackTrace();
				}				
			}
			return sqlMapper;		
	}	
	
	//회원가입 처리
	@Override
	public void join(MemberVO memberVO) {
		sqlMapper = getInstane();
		SqlSession session = sqlMapper.openSession();
		
		session.insert("join", memberVO);
		session.commit();
	}

	//로그인 처리
	@Override
	public MemberVO login(MemberVO memberVO) {
		sqlMapper = getInstane();
		SqlSession session = sqlMapper.openSession();

		return session.selectOne("login",memberVO);
	}

	@Override
	public int idCheck(String userId) {
		sqlMapper = getInstane();
		SqlSession session = sqlMapper.openSession();

		return session.selectOne("idCheck", userId);
	}

}