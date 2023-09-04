package com.osoondosson.service;

import com.osoondosson.dao.ScheduleDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleServiceImpl {

    @Autowired
    private ScheduleDAO scheduleDAO;
}
