package com.osoondosson.utill;

import com.osoondosson.security.config.CustomUserDetail;
import com.osoondosson.vo.chat.ChatingRoom;
import com.osoondosson.vo.chat.Message;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Data
@Component
@Slf4j
public class Chat {

    private LinkedList<ChatingRoom> chatingRoomList = new LinkedList<>();

    // 방 입장하기
    public boolean enterChatingRoom(ChatingRoom chatingRoom, String nickname) {
        createNickname(nickname);

        if (chatingRoom == null) {
            deleteCookie();
            return false;
        } else {
            LinkedList<String> users = chatingRoom.getUsers();
            users.add(nickname);

            log.info(users.toString());
            addCookie("roomNumber", chatingRoom.getRoomNumber());
            return true;
        }
    }

    public void addMessageToChatHistory(String roomNumber, Message message) {
        // 해당 방번호로 방 객체 찾기
        ChatingRoom room = findRoom(roomNumber);
        if (room != null) {
            List<Message> chatHistory = room.getChatHistory();
            chatHistory.add(message);
        }
    }

    // 닉네임 생성
    public void createNickname(String nickname) {
        addCookie("nickname", nickname);
    }

    // 쿠키에 추가
    public void addCookie(String cookieName, String cookieValue) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpServletResponse response = attr.getResponse();

        Cookie cookie = new Cookie(cookieName, cookieValue);

        int maxage = 60 * 60 * 24 * 7;
        cookie.setMaxAge(maxage);
        response.addCookie(cookie);
    }

    // 방 번호, 닉네임 쿠키 삭제
    public void deleteCookie( ) {
        ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
        HttpServletResponse response = attr.getResponse();

        Cookie roomCookie = new Cookie("roomNumber", null);
        Cookie nicknameCookie = new Cookie("nickname",null);

        roomCookie.setMaxAge(0);
        nicknameCookie.setMaxAge(0);

        response.addCookie(nicknameCookie);
        response.addCookie(roomCookie);
    }

    // 방 번호로 방 찾기
    public ChatingRoom findRoom(String roomNumber) {
        log.warn("chatingRoomList"+chatingRoomList);

        for (ChatingRoom room : chatingRoomList) {
            if (room.getRoomNumber().equals(roomNumber)) {
                return room;
            }
        }
        return null;

//        ChatingRoom room = ChatingRoom.builder().roomNumber(roomNumber).build();
//        int index = chatingRoomList.indexOf(room);
//
//        if(chatingRoomList.contains(room)) {
//            return chatingRoomList.get(index);
//        }
//        return null;
    }

    // 쿠키에서 방번호, 닉네임 찾기
    public Map<String, String> findCookie() {
        ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
        HttpServletRequest request = attr.getRequest();

        Cookie[] cookies = request.getCookies();
        String roomNumber = "";
        String nickname= "";

        if(cookies == null) {
            return null;
        }

        if(cookies != null) {
            for(int i=0;i<cookies.length;i++) {
                if("roomNumber".equals(cookies[i].getName())) {
                    roomNumber = cookies[i].getValue();
                }
                if("nickname".equals(cookies[i].getName())) {
                    nickname = cookies[i].getValue();
                }
            }

            if(!"".equals(roomNumber) && !"".equals(nickname)) {
                Map<String, String> map = new HashMap<>();
                map.put("nickname", nickname);
                map.put("roomNumber", roomNumber);

                return map;
            }
        }

        return null;
    }


}
