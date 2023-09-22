package com.osoondosson.dao;

import com.osoondosson.vo.ClassVO;
import com.osoondosson.vo.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GroupDAOImpl implements GroupDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<ClassVO> selectClass() {
        return sqlSession.selectList("selectClass");
    }

    @Override
    public int insertClass(ClassVO vo) {
        return sqlSession.insert("insertClass",vo);
    }

    @Override
    public List<UserVO> selectNullGroupUser() {
        return sqlSession.selectList("selectNullGroupUser");
    }

    @Override
    public int updateClass(Map<String, String> map) {
        if(sqlSession.update("updateClass",map)>0){
            return sqlSession.update("updateRoleType",map);
        }

        return 0;
    }
}
