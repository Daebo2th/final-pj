package com.osoondosson.controller.user;

import com.osoondosson.service.UserServiceImpl;
import com.osoondosson.utill.EmailAuthService;
import com.osoondosson.utill.TempKey;
import com.osoondosson.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;


@Controller
@Slf4j
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private EmailAuthService emailAuthService;

    @Autowired
    private JavaMailSenderImpl mailSender;

    // http://localhost:8080/auth/login
    //GET 요청
    @GetMapping("/auth/login")
    public String loginForm(Model model) {
        model.addAttribute("test", userService.getUser());
        return "auth/login";
    }

    // http://localhost:8080/auth/sign-up
    //GET 요청
    @GetMapping("/auth/sign-up")
    public String signUpForm() {

        return "auth/signUp";
    }

    // http://localhost:8080/auth/sign-up
    @PostMapping("/auth/sign-up")
    @ResponseBody
    public Map<String, String> signUp(@RequestBody UserVO user) {
        Map<String, String> status = new HashMap<>();
        status.put("status", "fail");
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String pwdEncode = passwordEncoder.encode(user.getUserPwd());
        user.setUserPwd(pwdEncode);

        if (userService.insertUser(user)) {
            status.put("status", "sucess");
        }

        return status;
    }

    @PostMapping("/auth/mail-check")
    @ResponseBody
    public Map<String, String> mail(@RequestBody String to, HttpSession session) {
        Map<String, String> status = new HashMap<>();

        if(userService.findById(to) != null){
            status.put("status", "duplication");
            return status;
        }

        if (emailAuthService.sendEmail(to, session)) {
            status.put("status", "SUCCESS");
        } else {
            status.put("status", "FAIL");
        }

        log.info(status.get("status"));
        return status;
    }

    @PostMapping("/auth/verify-authCode")
    @ResponseBody
    public Map<String, String> verifyAuthCode(@RequestBody Map<String,String> data, HttpSession session) {
        Map<String, String> status = new HashMap<>();
        String to = data.get("to");
        String authCode = data.get("authCode");

        if (emailAuthService.verifyAuthCode(to, authCode, session)) {
            status.put("status", "SUCCESS");
            session.removeAttribute(to);
            session.removeAttribute("validTime");
        } else {
            status.put("status", "FAIL");
        }

        return status;
    }

}
