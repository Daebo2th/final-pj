package com.osoondosson.service;

import com.osoondosson.vo.ScheduleVO;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public interface ScheduleService {
    List<Object> calendarList(String userId);
    void insertSchedule(ScheduleVO scheduleVO);
    void updateSchedule(ScheduleVO scheduleVO);
    void deleteSchedule(int scheduleSeq);
    void updateByDropSchedule(ScheduleVO scheduleVO);
}
