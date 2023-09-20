package com.osoondosson.controller.user;

import com.osoondosson.service.MyPageService;
import com.osoondosson.service.UserServiceImpl;
import com.osoondosson.utill.EmailAuthService;
import com.osoondosson.utill.TempKey;
import com.osoondosson.vo.UploadResponse;
import com.osoondosson.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.security.Principal;
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
    private MyPageService myPageService;

    // http://localhost:8080/auth/login
    //GET 요청
    @GetMapping("/auth/login")
    public String loginForm(Model model, Principal principal) {
        if(principal!=null)
            model.addAttribute("isLogin",true);
        return "auth/login";
    }

    @GetMapping("/auth/forgot")
    public String forgotInfo(Model model) {
        return "auth/forgotInfo";
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
    public Map<String, String> mail(@RequestBody UserVO vo, HttpSession session) {
        Map<String, String> status = new HashMap<>();

        if (vo.getName()!=null){
            if(!userService.getUserCountByIdAndName(vo)){
                status.put("status", "duplication");
                return status;
            }

            if (emailAuthService.sendEmail(vo.getUserId(), session)) {
                status.put("status", "SUCCESS");
            } else {
                status.put("status", "FAIL");
            }

        } else if(vo.getName()==null){
            if(userService.getUserCountByIdAndName(vo)){
                status.put("status", "duplication");
                return status;
            }

            if (emailAuthService.sendEmail(vo.getUserId(), session)) {
                status.put("status", "SUCCESS");
            } else {
                status.put("status", "FAIL");
            }
        }

        log.info(status.get("status"));
        return status;
    }

    @PostMapping("/auth/person-find-id")
    @ResponseBody
    public Map<String, String> findEmail(@RequestBody UserVO vo, HttpSession session) {
        Map<String, String> status = new HashMap<>();

        if(!userService.getUserCountByIdAndName(vo)){
            status.put("status", "notDuplication");
            return status;
        }

        status.put("status", "SUCCESS");
        return status;
    }

    @PostMapping("/auth/verify-authCode")
    @ResponseBody
    public Map<String, String> verifyAuthCode(@RequestBody Map<String,String> data, HttpSession session) {
        Map<String, String> status = new HashMap<>();
        String to = data.get("to");
        String authCode = data.get("authCode");

        log.warn(data.toString());
        if (emailAuthService.verifyAuthCode(to, authCode, session)) {
            status.put("status", "SUCCESS");
            session.removeAttribute(to);
            session.removeAttribute("validTime");
            status.put("msg","인증 성공!");
        } else {
            status.put("status", "FAIL");
        }

        return status;
    }

    @PostMapping("/auth/reset-pwd")
    @ResponseBody
    public Map<String, String> resetPwd(@RequestBody String key, Map<String, Object> map,Principal principal){
        Map<String,String> responseMap = new HashMap<>();

        map.put("userId", principal.getName());
        map.put("userPwd", key);

        responseMap.put("status", "FAIL");
        if(myPageService.updatePassWord(map)> 0){
            responseMap.put("status", "SUCCESS");
        }

        return responseMap;
    }

}
