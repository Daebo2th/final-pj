package com.osoondosson.controller.admin;

import com.osoondosson.security.config.CustomUserDetail;
import com.osoondosson.service.AdminServiceImpl;
import com.osoondosson.service.TaskService;
import com.osoondosson.vo.MemberWithClassVO;
import com.osoondosson.vo.PagingVO;
import com.osoondosson.vo.TaskVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class AdminController {

    @Autowired
    private AdminServiceImpl adminService;
    @Autowired
    private TaskService taskService;

    @GetMapping("/admin/student-record")
    public String stuRecord(Model model,Authentication authentication,
                            @RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
                            @RequestParam(value = "cntPerPage", required = false, defaultValue = "5") int cntPerPage) {
        CustomUserDetail detail= (CustomUserDetail) authentication.getPrincipal();
        String groupSeq= String.valueOf(detail.getGroupSeq());


        List<MemberWithClassVO> list = adminService.selectByGroup(Integer.parseInt(groupSeq));

        System.out.println("리스트: " + list);
        model.addAttribute("list", list);
        model.addAttribute("groupInfo",taskService.getGroupInfoBygroupSeq(Integer.parseInt(groupSeq)));
        return "admin/student-record";
    }

    @GetMapping("/admin/student-detail")
    public String stuDetail(Model model) {
        List<MemberWithClassVO> list = adminService.selectByGroup(1);
        System.out.println("리스트: " + list);
        model.addAttribute("list", list);
        return "admin/student-detail";
    }
    @GetMapping("/admin/stduent-daily-task-list")
    public String stuDailyTaskList(Model model,
                                   @RequestParam(value="studentUserId",required = false) String userId,
                                   @RequestParam(value = "searchCondition", required = false) String searchCondition,
                                   @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
                                   @RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
                                   @RequestParam(value = "cntPerPage", required = false, defaultValue = "5") int cntPerPage){


        Map<String, Object> map = new HashMap<>();
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
        System.out.println(taskUserList+"--------------------------------------------------------");

        model.addAttribute("userId", userId);
        model.addAttribute("pagingVO", pagingVO); //페이징 정보도 모델에 담아서 보내줍니다.
        model.addAttribute("taskUserList", taskUserList);

        return "/admin/stduent-daily-task-list";
    }
}
