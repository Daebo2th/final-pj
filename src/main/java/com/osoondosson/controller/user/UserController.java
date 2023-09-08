package com.osoondosson.controller.user;

import com.osoondosson.service.UserServiceImpl;
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
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;


@Controller
@Slf4j
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private JavaMailSenderImpl mailSender;

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
    public Map<String, String> mail(@RequestBody String to){
        Map<String,String> status = new HashMap<>();

        String subject = "DailyRecord 회원가입 인증번호";
        String content = "인증번호:"+new TempKey().getKey(10,true);
        String from = "ghgsb6200@gmail.com";


        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미

            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */

            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.

            mailSender.send(mail);
            status.put("status", "MainSend success");
        } catch(Exception e) {
            status.put("status", "MainSend fail");
            e.printStackTrace();
        }
        return status;
    }

}
