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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        model.addAttribute("taskVO", task);
        return "/student/daily-task-detail";
    }

    /*일일과제 수정 페이지로 이동*/
    @GetMapping("/student/daily-task-update")
    public String UpdateDailyTaskForm(Model model, @RequestParam("taskSeq") int taskSeq) {
        TaskVO vo = new TaskVO();
        vo.setTaskSeq(taskSeq);
        System.out.println(vo);
        TaskVO task = taskService.getDetailTask(vo);
        System.out.println(task);
        model.addAttribute("taskVO", task);
        return "/student/daily-task-update";
    }
    
    /*일일과제 수정 기능 처리*/
    @PostMapping("/student/daily-task-update")
    @ResponseBody
    public String DailyTaskUpdate(@RequestBody TaskVO vo) {
        System.out.println(vo);
        System.out.println("수정 컨트롤러로 탐 ");
        taskService.UpdateTask(vo);
        return "/student/daily-task-list"; /*일일과제 확인 페이지로 이동하기 위한 response를 ajax로 전달  */
    }


    /*일일과제 삭제 */
    @GetMapping("/student/daily-task-delete")
    public String DeleteDailyTask(@RequestParam("taskSeq") int taskSeq, RedirectAttributes redirectAttrs ) {
        System.out.println("삭제할 taskSeq: " + taskSeq);
        taskService.deleteTask(taskSeq);
        // 삭제가 완료되었음을 알리는 메시지를 추가합니다.
        redirectAttrs.addFlashAttribute("message", "삭제 성공 !!!!!! ");
        return "redirect:/student/daily-task-list";
    }


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

