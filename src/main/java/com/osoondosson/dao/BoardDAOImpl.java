package com.osoondosson.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.osoondosson.vo.UserVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

    @Autowired
    private SqlSession sqlSession;

	@Override
	public int selectCountUser() {
		System.out.println("==> mybatis selectCountUser() 호출 ");
		return sqlSession.selectOne("selectCountUser");
	}

	@Override
	public List<Map<String, Object>> findStatusCount(int groupSeq) {
		System.out.println("==> mybatis findStatusCount() 호출");
		return sqlSession.selectList("findStatusCount", groupSeq);
	}

	@Override
	public List<Map<String, Object>> findStatusNoCount(int groupSeq) {
		System.out.println("==> mybatis findStatusNoCount() 호출");
		return sqlSession.selectList("findStatusNoCount", groupSeq);
	}
}
