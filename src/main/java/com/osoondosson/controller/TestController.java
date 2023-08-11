package com.osoondosson.controller;

import com.osoondosson.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

    @Autowired
    private TestService testService;

    @GetMapping("/")
    public String test(Model model){

        model.addAttribute("test", testService.getUser());

        return "index";
    }


    @GetMapping("/auth/login")
    public String login(Model model){

        model.addAttribute("test", testService.getUser());

        return "auth/login";
    }


}
