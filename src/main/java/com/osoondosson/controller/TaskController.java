package com.osoondosson.controller;

import com.osoondosson.service.TaskService;
import com.osoondosson.vo.TaskVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
public class TaskController {
    @Autowired
    private TaskService taskService;

    //학생 일일과제 작성 기능
    @GetMapping("/student/daily-taskform")
    public String StudentMain(){
        return "/student/daily-taskform";
    }

    @PostMapping("/student/daily-task")
    @ResponseBody
    public String DailyTaskWrite(@RequestBody TaskVO vo){
        System.out.println("컨트롤러 여기까지왔다네");
        System.out.println(vo);

        taskService.insertTask(vo);
        return "/student/daily-checkform"; /*일일과제 확인 페이지로 이동 */
    }
}
