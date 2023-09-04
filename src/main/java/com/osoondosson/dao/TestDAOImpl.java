package com.osoondosson.dao;

import com.osoondosson.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class TestDAOImpl implements TestDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<UserVO> getUser() {
        List<UserVO> list = new ArrayList<>();

        try {
            TestDAO dao = sqlSession.getMapper(TestDAO.class);
            list = dao.getUser();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
