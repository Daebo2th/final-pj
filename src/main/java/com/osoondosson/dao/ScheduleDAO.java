package com.osoondosson.dao;

import com.osoondosson.vo.ScheduleVO;

import java.util.List;

public interface ScheduleDAO {
    List<Object> calendarList();
    void insertSchedule(ScheduleVO scheduleVO);
    void updateSchedule(ScheduleVO scheduleVO);
    void deleteSchedule(int scheduleSeq);
}
