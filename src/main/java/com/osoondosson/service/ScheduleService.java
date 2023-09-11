package com.osoondosson.service;

import com.osoondosson.vo.ScheduleVO;

import java.util.List;

public interface ScheduleService {
    List<Object> calendarList();

    void insertSchedule(ScheduleVO scheduleVO);
}
