package com.osoondosson.service;

import com.osoondosson.dao.ScheduleDAO;
import com.osoondosson.vo.ScheduleVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleServiceImpl implements ScheduleService{

    @Autowired
    private ScheduleDAO scheduleDAO;

    @Override
    public List<Object> calendarList() {
        return scheduleDAO.calendarList();
    }

    @Override
    public void insertSchedule(ScheduleVO scheduleVO) {
        scheduleDAO.insertSchedule(scheduleVO);
    }


    public void updateSchedule(ScheduleVO scheduleVO) {
        scheduleDAO.updateSchedule(scheduleVO);
    }

    public void deleteSchedule(int scheduleSeq) {
        scheduleDAO.deleteSchedule(scheduleSeq);
    }
}
