package com.osoondosson.dao.admin;

import com.osoondosson.dao.user.UserDAO;
import com.osoondosson.vo.MemberWithClassVO;
import com.osoondosson.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Slf4j
public class AdminDAOImpl implements AdminDAO{

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public List<MemberWithClassVO> selectByGroup(int groupSeq) {
        return sqlSession.selectList("selectByGroup", groupSeq);
    }
}
