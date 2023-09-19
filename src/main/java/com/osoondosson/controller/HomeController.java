package com.osoondosson.controller;

import com.osoondosson.service.TaskService;
import com.osoondosson.service.TestService;
import com.osoondosson.vo.TaskVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;

@Controller
@Slf4j
public class HomeController {

    @Autowired
    private TestService testService;

    //  http://localhost:8080/
    @GetMapping("/")
    public String test(Model model,Authentication auth,  Principal principal){
        model.addAttribute("user",auth.getAuthorities());
//        model.addAttribute("user", principal);
        log.info("index");
        return "index";
    }

    @GetMapping("/error/accessError")
    public String accessDeniend(Authentication auth, Model model) {
        log.info("access Denied: "+ auth);

        model.addAttribute("msg", "죄송합니다. 요청하신 페이지에 대한 접근 권한이 없습니다.");

        return "error/accessError";
    }

}
