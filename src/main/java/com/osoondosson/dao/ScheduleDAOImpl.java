package com.osoondosson.dao;

import com.osoondosson.vo.ScheduleVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO{

    @Autowired
    private SqlSessionTemplate sqlSession;


    @Override
    public List<Object> calendarList() {
        return sqlSession.selectList("calendarList");
    }

    @Override
    public void insertSchedule(ScheduleVO scheduleVO) {
        sqlSession.insert("insertSchedule",scheduleVO);
    }

    @Override
    public void updateSchedule(ScheduleVO scheduleVO) {
        sqlSession.update("updateSchedule",scheduleVO);
    }

    @Override
    public void deleteSchedule(int scheduleSeq) {
        sqlSession.delete("deleteSchedule", scheduleSeq);
    }

    @Override
    public void updateByDropSchedule(ScheduleVO scheduleVO) {
        sqlSession.update("updateByDropSchedule", scheduleVO);
    }


}
