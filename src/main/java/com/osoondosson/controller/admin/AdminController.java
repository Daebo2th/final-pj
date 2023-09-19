package com.osoondosson.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.osoondosson.security.config.CustomUserDetail;
import com.osoondosson.service.AdminServiceImpl;
import com.osoondosson.service.BoardServiceImpl;
import com.osoondosson.service.MyPageService;
import com.osoondosson.service.TaskService;
import com.osoondosson.vo.MemberWithClassVO;
import com.osoondosson.vo.PagingVO;
import com.osoondosson.vo.TaskVO;
import com.osoondosson.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AdminController {

    @Autowired
    private AdminServiceImpl adminService;
    
    @Autowired
    private BoardServiceImpl boardService;
    
	/*
	 * @GetMapping("/admin") public String selectCountUser(Model model) { int user =
	 * boardService.selectCountUser(); model.addAttribute("user", user); return
	 * "index"; }
	 */
    
    @GetMapping("/admin")
    public String findStatusCount(Model model, Authentication authentication) {
    	CustomUserDetail detail= (CustomUserDetail) authentication.getPrincipal();
    	List<Map<String, Object>> count = boardService.findStatusCount(detail.getGroupSeq());
    	List<Map<String, Object>> noCount = boardService.findStatusNoCount(detail.getGroupSeq());
    	model.addAttribute("user", boardService.selectCountUser());
    	model.addAttribute("count", count);
    	model.addAttribute("noCount", noCount);
    	return "teacher/main";
    }


    @Autowired
    private TaskService taskService;
    @Autowired
    private MyPageService myPageService;

    @GetMapping("/admin/student-record")
    public String stuRecord(Model model,Authentication authentication,
                            @RequestParam(value = "nowPage", required = false, defaultValue = "1") int nowPage,
                            @RequestParam(value = "cntPerPage", required = false, defaultValue = "5") int cntPerPage) {
        CustomUserDetail detail= (CustomUserDetail) authentication.getPrincipal();
        int groupSeq= detail.getGroupSeq();

        Map<String, Object> map =new HashMap<>();
        map.put("groupSeq", groupSeq);

        int total=adminService.countStudent(map);
        PagingVO pagingVO= new PagingVO(total, nowPage,cntPerPage);
        map.put("start", pagingVO.getStart());
        map.put("end", pagingVO.getEnd());

        System.out.println(pagingVO+"-------------------------------------");

        List<MemberWithClassVO> list = adminService.selectByGroup(map);

        System.out.println("리스트: " + list);
        model.addAttribute("list", list);
        model.addAttribute("pagingVO", pagingVO);
        model.addAttribute("groupInfo",taskService.getGroupInfoBygroupSeq(groupSeq));
        return "admin/student-record";
    }

    @GetMapping("/admin/student-detail")
    public String stuDetail(Model model,Authentication authentication,
                            @RequestParam(value = "studentUserId", required = false) String userId) {
        CustomUserDetail detail= (CustomUserDetail) authentication.getPrincipal();
        String groupSeq= String.valueOf(detail.getGroupSeq());

        Map<String, Object> map =new HashMap<>();
        map.put("groupSeq", String.valueOf(groupSeq));

        System.out.println("유저아이디:" + userId);
        UserVO studentList = myPageService.selectMyPage(userId);
        model.addAttribute("mypage", studentList);
        System.out.println("리스트2 : " + studentList);
        //model.addAttribute("list", list);
        return "admin/student-detail";
    }
    @GetMapping("/admin/student-daily-task-list")
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

        return "/admin/student-daily-task-list";
    }
}
