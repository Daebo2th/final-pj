package com.osoondosson.controller;

import com.osoondosson.service.ScheduleServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@Slf4j
public class ScheduleController {

    @Autowired
    private ScheduleServiceImpl scheduleService;
}
