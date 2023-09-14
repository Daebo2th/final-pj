package com.osoondosson.controller;

import com.osoondosson.service.ReplyService;
import com.osoondosson.service.ReplyServiceImpl;
import com.osoondosson.vo.ReplyVO;
import com.osoondosson.vo.TaskVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    @PostMapping("/teacher/daily-task-reply")
    @ResponseBody
    public String teacherInsertReply(@RequestBody ReplyVO vo){
        System.out.println("replyService 까지는 오니 ??");
        System.out.println("ReplyVO:-----------------------"+vo);
        replyService.insertReply(vo);
        return "/teacher/daily-task-reply";
    }
    @GetMapping("/teacher/reply-list")
    @ResponseBody
    public List<TaskVO> teacherGetReplyList(Model model, Principal principal,
                                     @RequestParam("taskSeq") int taskSeq){
        String userId = principal.getName();
        System.out.println("userID:-------------------------------------"+userId);
        model.addAttribute("userId", principal.getName());
        System.out.println("taskSeq:"+ taskSeq);
        List<TaskVO> replyList = replyService.getReplyList(taskSeq);
        System.out.println("replyList:"+replyList);
        return replyList;
    }

    @PostMapping("/student/daily-task-reply")
    @ResponseBody
    public String StudentInsertReply(@RequestBody ReplyVO vo){
        System.out.println("replyService 까지는 오니 ??");
        System.out.println("ReplyVO:-----------------------"+vo);
        replyService.insertReply(vo);
        return "/student/daily-task-reply";
    }

    @GetMapping("/student/reply-list")
    @ResponseBody
    public List<TaskVO> studentGetReplyList(Model model, Principal principal,
                                     @RequestParam("taskSeq") int taskSeq){
        String userId = principal.getName();
        System.out.println("userID:-------------------------------------"+userId);
        model.addAttribute("userId", principal.getName());
        System.out.println("taskSeq:"+ taskSeq);
        List<TaskVO> replyList = replyService.getReplyList(taskSeq);
        System.out.println("replyList:"+replyList);
        return replyList;
    }


}
