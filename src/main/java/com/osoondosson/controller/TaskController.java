package com.osoondosson.controller;

import com.osoondosson.service.TaskService;
import com.osoondosson.vo.TaskVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class TaskController {
    @Autowired
    private TaskService taskService;
    /*학생*/
    /*학생 Layout Page로 이동 */
    @GetMapping("/student/SMain")
    public String StudentMain(Model model, Principal principal) {
        model.addAttribute("userId", principal.getName());
        return "/student/SMain";
    }



    //학생 일일과제 작성 기능
    @GetMapping("/student/daily-task")
    public String StudentTemplate(Model model, Principal principal) {
        model.addAttribute("userId", principal.getName());
        return "student/daily-task-write";
    }


    @PostMapping("/student/daily-task")
    @ResponseBody
    public String DailyTaskWrite(@RequestBody TaskVO vo) {
        System.out.println(vo);
        taskService.insertTask(vo);
        return "/student/daily-task-list"; /*일일과제 확인 페이지로 이동하기 위한 response를 ajax로 전달  */
    }
    /*학생이 작성한 일일과제 목록 보기 페이지*/
    @GetMapping("/student/daily-task-list")
    public String DailyTaskList(Model model, Principal principal){
        Map<String, String> map = new HashMap<>();
        map.put("userId", principal.getName());
        List<TaskVO> taskUserList = taskService.getTaskUserList((HashMap) map);
        model.addAttribute("taskUserList", taskService.getTaskUserList((HashMap) map));
        return "/student/daily-task-list";
    }
    /*일일과제 상세 보기 페이지 */
    @GetMapping("/student/daily-task-detail")
    public String DetailDailyTask(Model model, TaskVO vo) {
        TaskVO task = taskService.getDetailTask(vo);
        System.out.println("이부부부ㅜ부부부부부부부부부ㅜㄴ");
        model.addAttribute("taskVO", task);
        return "/student/daily-task-detail";
    }

    /*일일과제 수정*/


    /*일일과제 삭제 */
/*    public String DeleteDailyTask()*/


    /*교직원*/
    /*교직원 Layout Page로 이동 */
    @GetMapping("/teacher/TMain")
    public String TeacherMain(Model model, Principal principal) {
        model.addAttribute("userId", principal.getName());
        return "teacher/TMain";
    }

    /*일일과제확인 페이지로 이동(전체목록출력) */
    @GetMapping("/student/daily-task-check")
    public String DailyTaskCheck(Model model) {
        Map<String, String> map = new HashMap<>();
        List<TaskVO> taskList = taskService.getTaskList((HashMap) map);
        model.addAttribute("taskList", taskService.getTaskList((HashMap) map));
        return "teacher/daily-task-check";
    }
}

