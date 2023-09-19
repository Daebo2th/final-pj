package com.osoondosson.dao;

import com.osoondosson.vo.ScheduleVO;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface ScheduleDAO {
    List<Object> calendarList(String userId);
    void insertSchedule(ScheduleVO scheduleVO);
    void updateSchedule(ScheduleVO scheduleVO);
    void deleteSchedule(int scheduleSeq);
    void updateByDropSchedule(ScheduleVO scheduleVO);
}
