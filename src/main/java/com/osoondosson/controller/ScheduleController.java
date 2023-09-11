package com.osoondosson.controller;

import com.osoondosson.service.ScheduleServiceImpl;
import com.osoondosson.vo.ScheduleVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

@Controller
@Slf4j
public class ScheduleController {

    @Autowired
    private ScheduleServiceImpl scheduleService;

//    @GetMapping("/schedule/main")
//    public String ScheduleMain(){
//        return "/schedule/schedule";
//    }

//    @GetMapping("/schedule/main")
//    public String calendarList() {
//        return "/schedule/main";
//    }

    // 일정 조회
    @GetMapping("/schedule/main")
    public String data(Model model) {
        model.addAttribute("list",scheduleService.calendarList());
        return "/admin/schedule-management";
    }

    // 달력

    // 일정 등록
//    @PostMapping("/adms/schedule/create")
    @RequestMapping(value = "/schedule/create" ,method = RequestMethod.POST)
    @ResponseBody
    public HashMap createSchedule(
            @RequestBody
            ScheduleVO scheduleVO
            ) throws Exception {

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
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

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println("데이터: " + scheduleVO);

        scheduleService.updateSchedule(scheduleVO);

        HashMap map = new HashMap<>();
        map.put("status","success");
        map.put("list",scheduleService.calendarList());
        System.out.println("리스트:"+scheduleService.calendarList());
        return map;
    }

    @RequestMapping(value = "/schedule/delete", method = RequestMethod.POST)
    @ResponseBody
    public HashMap deleteSchedule(@RequestBody Map<String, String> payload) {
        int scheduleSeq = Integer.parseInt(payload.get("scheduleSeq"));
        System.out.println("스케줄 :" + scheduleSeq);
        scheduleService.deleteSchedule(scheduleSeq);
        HashMap map = new HashMap<>();
        map.put("status","success");
        return map;
    }
}
