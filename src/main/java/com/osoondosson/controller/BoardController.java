package com.osoondosson.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.osoondosson.security.config.CustomUserDetail;
import com.osoondosson.service.BoardServiceImpl;
import com.osoondosson.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class BoardController {

    @Autowired
    private BoardServiceImpl boardService;
    
    @GetMapping("/student")
    public String findStatusCount(Model model, Authentication authentication) {
    	CustomUserDetail detail= (CustomUserDetail) authentication.getPrincipal();
    	List<Map<String, Object>> count = boardService.findStatusCount(detail.getGroupSeq());
    	UserVO vo = new UserVO();
    	vo.setUserId(detail.getUsername());
    	vo.setGroupSeq(detail.getGroupSeq());
    	List<Map<String, Object>> task = boardService.selectMyTask(vo);
    	List<Map<String, Object>> taskStatus = boardService.selectMyTaskStatus(vo);
    	model.addAttribute("user", boardService.selectCountUser(detail.getGroupSeq()));
    	model.addAttribute("count", count);
    	model.addAttribute("task", task);
    	model.addAttribute("taskStatus", taskStatus);
    	return "student/main";
    }
}
