package com.osoondosson.controller;

import com.osoondosson.service.BoardService;
import com.osoondosson.service.BoardServiceImpl;
import com.osoondosson.vo.UserVO;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
public class BoardController {

    @Autowired
    private BoardServiceImpl boardService;
    
//    @PostMapping("/")
//    public String selectCountUser(Model model) {
//    	int user = boardService.selectCountUser();
//    	model.addAttribute("user", user);
//    	return "/";
//    }
}
