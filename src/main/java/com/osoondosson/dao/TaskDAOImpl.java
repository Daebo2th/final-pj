package com.osoondosson.dao;

import com.osoondosson.vo.TaskVO;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;


@Repository("taskDAO")
public class TaskDAOImpl implements TaskDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    @Override
    public void insertTask(TaskVO vo ) {
        System.out.println("==> mybatis insertTask() 호출 ");
        mybatis.insert("com.osoondosson.dao.TaskDAO.insertTask", vo);
    }

    @Override
    public List<TaskVO> getTaskUserList(HashMap map) {
        System.out.println("===> Mybatis  getTaskUserList() 호출");
        return mybatis.selectList("com.osoondosson.dao.TaskDAO.selectUserTaskList", map);
    }

    @Override
    public TaskVO getDetailTask(TaskVO vo) {
        System.out.println(vo);
        System.out.println("===> Mybatis 상세 보기 호출");
        return mybatis.selectOne("com.osoondosson.dao.TaskDAO.detailTask", vo);
    }

    @Override
    public List<TaskVO> getTaskList(HashMap map) {
        return mybatis.selectList("com.osoondosson.dao.TaskDAO.selectAllTask",map);
    }
}
