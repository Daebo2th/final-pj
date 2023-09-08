package com.osoondosson.controller.user;

import com.osoondosson.service.UserServiceImpl;
import com.osoondosson.utill.MailSender;
import com.osoondosson.utill.TempKey;
import com.osoondosson.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

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
    @PostMapping("/auth/sign-up" )
    @ResponseBody
    public Map<String, String> signUp(@RequestBody UserVO user){
        Map<String,String> status = new HashMap<>();
        status.put("status", "fail");
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String pwdEncode = passwordEncoder.encode(user.getUserPwd());
        user.setUserPwd(pwdEncode);

        if(userService.insertUser(user)){
            status.put("status", "sucess");
        }

        return status;
    }

    @PostMapping("/auth/mail-check")
    @ResponseBody
    public Map<String, String> mail(@RequestParam String to){
        Map<String,String> status = new HashMap<>();
        log.info("tttttttttttttttttttttttttttttttttttttttttttttttttttt");
        status.put("status", "fail");
        try {
            MailSender.sendMailTest(to);
        } catch (Exception e) {
            status.put("status", "sucess");
            e.printStackTrace();
        }

        return status;
    }

}
