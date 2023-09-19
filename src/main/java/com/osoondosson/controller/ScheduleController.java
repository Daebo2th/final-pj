package com.osoondosson.controller;

import com.osoondosson.security.config.CustomUserDetail;
import com.osoondosson.service.ScheduleServiceImpl;
import com.osoondosson.vo.ScheduleVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;


@Controller
@Slf4j
public class ScheduleController {

    @Autowired
    private ScheduleServiceImpl scheduleService;

    // 일정 조회
    @GetMapping("/schedule/main")
    public String data(Model model, HttpServletRequest request, Authentication auth) {
        CustomUserDetail detail = (CustomUserDetail) auth.getPrincipal();
        System.out.println("디테일" + detail.getName());
        System.out.println("디테일" + detail.getUsername());
        HttpSession session = request.getSession(); //
        System.out.println("세션 : " + session);// 현재 요청의 세션 객체 얻기
        model.addAttribute("list",scheduleService.calendarList(detail.getUsername()));
        model.addAttribute("userId", detail.getUsername());
        return "/admin/schedule-management";
    }

    // 일정 등록
//    @PostMapping("/adms/schedule/create")
    @RequestMapping(value = "/schedule/create" ,method = RequestMethod.POST)
    @ResponseBody
    public HashMap createSchedule(
            @RequestBody
            ScheduleVO scheduleVO,
            Authentication auth
            ) throws Exception {
        CustomUserDetail detail = (CustomUserDetail) auth.getPrincipal();
        System.out.println("데이터: " + scheduleVO);

        scheduleService.insertSchedule(scheduleVO);

        HashMap map = new HashMap<>();
        map.put("status","success");
        map.put("list",scheduleService.calendarList(detail.getUsername()));
        return map;
    }

    // 일정 수정
    @RequestMapping(value = "/schedule/update" ,method = RequestMethod.POST)
    @ResponseBody
    public HashMap updateSchedule (
            @RequestBody
            ScheduleVO scheduleVO,
            Authentication auth
    ) throws Exception {
        CustomUserDetail detail = (CustomUserDetail) auth.getPrincipal();
        System.out.println("데이터: " + scheduleVO);

        scheduleService.updateSchedule(scheduleVO);

        HashMap map = new HashMap<>();
        map.put("status","success");
        map.put("list",scheduleService.calendarList(detail.getUsername()));
        return map;
    }

    // 일정 드레그 드롭시 날짜 수정
    @RequestMapping(value = "/schedule/updateByDrop", method = RequestMethod.POST)
    @ResponseBody
    public HashMap updateByDropSchedule (
            @RequestBody ScheduleVO scheduleVO) {
        System.out.println("시작: " + scheduleVO.getStartDate());
        System.out.println("끝: " + scheduleVO.getEndDate());
        scheduleService.updateByDropSchedule(scheduleVO);
        
        HashMap map = new HashMap<>();
        map.put("status","success");
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
