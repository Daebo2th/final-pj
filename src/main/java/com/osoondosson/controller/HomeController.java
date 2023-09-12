package com.osoondosson.controller;

import com.osoondosson.service.TaskService;
import com.osoondosson.service.TestService;
import com.osoondosson.vo.TaskVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Slf4j
public class HomeController {

    @Autowired
    private TestService testService;

    //  http://localhost:8080/
    @GetMapping("/")
    public String test(Model model){

        model.addAttribute("test", testService.getUser());
        log.info("index");
        return "index";
    }
}
