package com.osoondosson.controller;

import com.osoondosson.service.ScheduleServiceImpl;
import com.osoondosson.vo.ScheduleVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;


@Controller
@Slf4j
public class ScheduleController {

    @Autowired
    private ScheduleServiceImpl scheduleService;

    // 일정 조회
    @GetMapping("/schedule/main")
    public String data(Model model) {
        model.addAttribute("list",scheduleService.calendarList());
        return "/admin/schedule-management";
    }

    // 일정 등록
//    @PostMapping("/adms/schedule/create")
    @RequestMapping(value = "/schedule/create" ,method = RequestMethod.POST)
    @ResponseBody
    public HashMap createSchedule(
            @RequestBody
            ScheduleVO scheduleVO
            ) throws Exception {

        System.out.println("데이터: " + scheduleVO);

        scheduleService.insertSchedule(scheduleVO);

        HashMap map = new HashMap<>();
        map.put("status","success");
        map.put("list",scheduleService.calendarList());
        System.out.println("리스트:"+scheduleService.calendarList());
        return map;
    }

    // 일정 수정
    @RequestMapping(value = "/schedule/update" ,method = RequestMethod.POST)
    @ResponseBody
    public HashMap updateSchedule (
            @RequestBody
            ScheduleVO scheduleVO
    ) throws Exception {

        System.out.println("데이터: " + scheduleVO);

        scheduleService.updateSchedule(scheduleVO);

        HashMap map = new HashMap<>();
        map.put("status","success");
        map.put("list",scheduleService.calendarList());
        System.out.println("리스트:"+scheduleService.calendarList());
        return map;
    }

    // 일정 삭제
    @RequestMapping(value = "/schedule/delete", method = RequestMethod.POST)
    @ResponseBody
    public HashMap deleteSchedule(@RequestBody String scheduleSeq) {
        int seq = Integer.parseInt(scheduleSeq);
        System.out.println("스케줄 :" + seq);
        scheduleService.deleteSchedule(seq);
        HashMap map = new HashMap<>();
        map.put("status","success");
        return map;
    }
}
