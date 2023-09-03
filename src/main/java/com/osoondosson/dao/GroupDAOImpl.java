package com.osoondosson.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupDAOImpl implements GroupDAO{

    @Autowired
    private SqlSession sqlSession;
}
