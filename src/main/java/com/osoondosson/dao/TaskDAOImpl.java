package com.osoondosson.dao;

import com.osoondosson.vo.TaskVO;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("taskDAO")
public class TaskDAOImpl implements TaskDAO {

    @Autowired
    private SqlSessionTemplate mybatis;
    @Override
    public void insertTask(TaskVO vo ) {
        System.out.println("==> mybatis insertTask() 호출 ");
        mybatis.insert("com.osoondosson.dao.TaskDAO.insertTask", vo);
    }
}
