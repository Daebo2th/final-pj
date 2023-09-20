package com.osoondosson.utill;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

@Service
public class EmailAuthService {

    @Autowired
    private JavaMailSender mailSender;

    public boolean sendEmail(String to, HttpSession session){
        String authCode = new TempKey().getKey(6,true);
                String subject = "DailyRecord 회원가입 인증번호";
        String emailContent = "<!DOCTYPE html>"
                + "<html>"
                + "<head>"
                + "<title>이메일 인증</title>"
                + "<style>"
                + "/* 스타일을 원하는 대로 수정하세요. */"
                + "body {"
                + "    font-family: Arial, sans-serif;"
                + "    background-color: #f4f4f4;"
                + "}"
                + ".container {"
                + "    max-width: 600px;"
                + "    margin: 0 auto;"
                + "    padding: 20px;"
                + "    background-color: #fff;"
                + "    border-radius: 5px;"
                + "    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);"
                + "}"
                + "h2 {"
                + "    color: #333;"
                + "}"
                + "p {"
                + "    color: #555;"
                + "}"
                + ".verification-code {"
                + "    font-size: 24px;"
                + "    font-weight: bold;"
                + "    color: #007bff;"
                + "}"
                + "</style>"
                + "</head>"
                + "<body>"
                + "<div class=\"container\">"
                + "<h2>이메일 인증</h2>"
                + "<p>아래의 인증번호를 사용하여 계정을 인증하세요:</p>"
                + "<p>인증번호: <span class=\"verification-code\">" + authCode + "</span></p>"
                + "</div>"
                + "</body>"
                + "</html>";
        String from = "ghgsb6200@gmail.com";




        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미

            mailHelper.setFrom(from);
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(emailContent, true);

            mailSender.send(mail);

            session.setAttribute(to,authCode);
            // 유효시간
            session.setAttribute("validTime", System.currentTimeMillis() + (3 * 60 * 1000)); // 3분(밀리초 단위) 후 만료

            return true;
        } catch(Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean verifyAuthCode(String to, String authCode, HttpSession session) {
        String correctAuthCode = (String)session.getAttribute(to);
        Long validTime = (Long) session.getAttribute("validTime");

        if (correctAuthCode != null && validTime != null && validTime > System.currentTimeMillis()) {
            return correctAuthCode.equals(authCode);  // 사용자가 입력한 인증 코드와 일치하는지 확인
        } else {
            return false;  // 인증 코드가 없거나 만료된 경우
        }
    }

}
