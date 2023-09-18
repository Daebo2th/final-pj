package com.osoondosson.controller;

import com.osoondosson.security.config.CustomUserDetail;
import com.osoondosson.service.TaskService;
import com.osoondosson.service.UserService;
import com.osoondosson.vo.ClassVO;
import com.osoondosson.vo.PagingVO;
import com.osoondosson.vo.TaskVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class TaskController {
    @Autowired
    private TaskService taskService;

    @Autowired
    private UserService userService;

    /*학생*/
    /*학생 Layout Page로 이동 */
    @GetMapping("/student/SMain")
    public String StudentMain(Model model, Authentication authentication) {
        CustomUserDetail detail= (CustomUserDetail) authentication.getPrincipal();
        String userId= detail.getUsername();

        model.addAttribute("userId", userId);
        return "/student/SMain";
    }
    
    //학생 일일과제 작성 기능
    @GetMapping("/student/daily-task")
    public String StudentTemplate(Model model, Authentication authentication) {
        CustomUserDetail detail= (CustomUserDetail) authentication.getPrincipal();
        String userId= detail.getUsername();
        String userName=detail.getName();
        model.addAttribute("userId", userId);
        model.addAttribute("userName", userName);
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
    public String DailyTaskList(Model model,
                                Authentication authentication,
                                @RequestParam(value = "searchCondition", required = false) String searchCondition,
                                @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
                                @RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
                                @RequestParam(value = "cntPerPage", required = false, defaultValue = "5") int cntPerPage){

        /*조회 조건*/
        CustomUserDetail detail= (CustomUserDetail) authentication.getPrincipal();
        Map<String, Object> map = new HashMap<>();
        String userId= detail.getUsername();
        map.put("userId",userId);

        map.put("searchCondition", searchCondition);
        map.put("searchKeyword",searchKeyword);

        int total = taskService.countTasks(map);
        PagingVO pagingVO= new PagingVO(total, nowPage,cntPerPage);
        map.put("start", pagingVO.getStart());
        map.put("end", pagingVO.getEnd());

        System.out.println("paginVO:------------------------"+pagingVO);


        List<TaskVO> taskUserList;
        taskUserList = taskService.getTaskUserList((HashMap) map);
       /* System.out.println(taskUserList);*/

        model.addAttribute("pagingVO", pagingVO); //페이징 정보도 모델에 담아서 보내줍니다.
        model.addAttribute("taskUserList", taskUserList);

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
        TaskVO task = taskService.getDetailTask(vo);
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


    /***************************************교직원********************************************************/
    /*교직원 일일과제 현황 페이지로 이동 */

    /*일일과제확인 페이지로 이동(전체목록출력) */
    @GetMapping("/teacher/daily-task-check")
    public String DailyTaskCheckPage(Model model, Authentication authentication,
                                     @RequestParam(value = "searchCondition", required = false) String searchCondition,
                                     @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
                                     @RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
                                     @RequestParam(value = "cntPerPage", required = false, defaultValue = "5") int cntPerPage,
                                     HttpSession session) {
        CustomUserDetail detail= (CustomUserDetail) authentication.getPrincipal();
        int groupSeq = detail.getGroupSeq();

        Map<String, Object> map =new HashMap<>();
        map.put("groupSeq", String.valueOf(groupSeq));
        // 처음으로 검색을 실행하는 경우

        map.put("searchCondition", searchCondition);
        map.put("searchKeyword",searchKeyword);
        System.out.println(map);

        int total = taskService.countGroupSeqTasks(map);
        PagingVO pagingVO= new PagingVO(total, nowPage,cntPerPage);
        map.put("start", pagingVO.getStart());
        map.put("end", pagingVO.getEnd());

        System.out.println(pagingVO+"-------------------------------");

        /*목록 출력*/
        List<TaskVO> groupTasks = taskService.getTaskGroupSeq((HashMap) map);
        System.out.println("groupTasks:------------------------------------"+groupTasks);
        model.addAttribute("pagingVO", pagingVO); //페이징 정보도 모델에 담아서 보내줍니
        model.addAttribute("groupTasks", groupTasks);
        model.addAttribute("groupInfo",taskService.getGroupInfoBygroupSeq(groupSeq));
        return "/teacher/daily-task-check";
    }

    @GetMapping("/teacher/daily-task-detail")
    public String DetailCheckDailyTask(Model model, TaskVO vo) {
        System.out.println("VO:-----------------------"+vo);
        TaskVO task = taskService.getDetailTask(vo);
        model.addAttribute("taskVO", task);
        return "/teacher/daily-task-detail-check";
    }

    @PostMapping("/teacher/updateTaskStatus")
    @ResponseBody
    public String updateTaskStatus(@RequestBody TaskVO vo){
        taskService.updateStatus(vo);
        return "/teacher/updateTaskStatus";
    }


}

