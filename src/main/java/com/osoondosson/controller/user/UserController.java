package com.osoondosson.controller.user;

import com.osoondosson.service.UserServiceImpl;
import com.osoondosson.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Slf4j
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    // http://localhost:8080/auth/login
    //GET 요청
    @GetMapping("/auth/login")
    public String loginForm(Model model){
        model.addAttribute("test", userService.getUser());
        return "auth/login";
    }

    // http://localhost:8080/auth/sign-up
    //GET 요청
    @GetMapping("/auth/sign-up")
    public String signUpForm(){

        return "auth/signUp";
    }

    // http://localhost:8080/auth/sign-up
    @PostMapping("/auth/sign-up")
    @ResponseBody
    public String signUp(@RequestBody UserVO user){

        return "[signUp] "+user;
    }


}
