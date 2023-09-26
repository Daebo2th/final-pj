package com.osoondosson.controller.chat;


import com.osoondosson.utill.Chat;
import com.osoondosson.vo.chat.ChatingRoom;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.*;


@Controller
@Slf4j
public class ChatController {

    @Autowired
    private Chat chat;
//    private Chat chat = new Chat();



    @GetMapping("/chat/main")
    public String chatMain(){
        return "common/chat/chatting";
    }

    // 채팅방 목록
    @GetMapping("/chatingRoomList")
    public ResponseEntity<?> chatingRoomList() {
        log.warn("채팅방 목록"+chat.getChatingRoomList());
        return new ResponseEntity<LinkedList<ChatingRoom>>(chat.getChatingRoomList(), HttpStatus.OK);
    }

    // 방 만들기
    @PostMapping("/chatingRoom")
    public ResponseEntity<?> chatingRoom(String roomName, String nickname) {

        // 방을 만들고 채팅방목록에 추가
        String roomNumber = UUID.randomUUID().toString();
        ChatingRoom chatingRoom = ChatingRoom.builder()
                .roomNumber(roomNumber)
                .users(new LinkedList<>())
                .roomName(roomName)
                .chatHistory(new ArrayList<>())
                .build();

        chat.getChatingRoomList().add(chatingRoom);

        // 방 입장하기
        chat.enterChatingRoom(chatingRoom, nickname);

        return new ResponseEntity<>(chatingRoom, HttpStatus.OK);
    }

    // 방 들어가기
    @GetMapping("/chatingRoom-enter")
    public ResponseEntity<?> EnterChatingRoom(String roomNumber, String nickname){

        // 방 번호로 방 찾기
        ChatingRoom chatingRoom = chat.findRoom(roomNumber);

        if(chatingRoom == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            // 방 들어가기
            chat.enterChatingRoom(chatingRoom, nickname);

            return new ResponseEntity<>(chatingRoom, HttpStatus.OK);
        }
    }

    // 방 나가기
    @PatchMapping("/chatingRoom-exit")
    public ResponseEntity<?> ExitChatingRoom(){

        Map<String, String> map = chat.findCookie();

        if(map == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }


        String roomNumber = map.get("roomNumber");
        String nickname = map.get("nickname");

        // 방목록에서 방번호에 맞는 유저목록 가져오기
        ChatingRoom chatingRoom = chat.findRoom(roomNumber);
        List<String> users = chatingRoom.getUsers();

        // 닉네임 삭제
        users.remove(nickname);

        // 쿠키에서 닉네임과 방번호 삭제
        chat.deleteCookie();

        // 유저가 한명도 없다면 방 삭제
        if(users.size() == 0) {
            chat.getChatingRoomList().remove(chatingRoom);
        }

        return new ResponseEntity<>(chatingRoom, HttpStatus.OK);
    }

    // 참가 중이었던 대화방
    @GetMapping("/chatingRoom")
    public ResponseEntity<?> chatingRoom() {
        // 쿠키에 닉네임과 방번호가 있다면 대화중이던 방이 있던것
        Map<String, String> map = chat.findCookie();

        if(map == null) {
            return new ResponseEntity<>(HttpStatus.OK);
        }

        String roomNumber = map.get("roomNumber");
        String nickname = map.get("nickname");

        ChatingRoom chatingRoom = chat.findRoom(roomNumber);

        if(chatingRoom == null) {
            chat.deleteCookie();
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        } else {
            Map<String, Object> map2 = new HashMap<>();
            map2.put("chatingRoom", chatingRoom);
            map2.put("myNickname", nickname);

            return new ResponseEntity<>(map2, HttpStatus.OK);
        }
    }

}
