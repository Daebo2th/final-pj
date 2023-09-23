package com.osoondosson.controller.chat;

import com.osoondosson.utill.Chat;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import java.util.Map;
import com.osoondosson.vo.chat.Message;


@Controller
@Slf4j
public class MessageController {

    @Autowired
    private Chat chat;
    // 여기서 메세지가 오면 방목록 업데이트
    @MessageMapping("/socket/roomList")
    @SendTo("/topic/roomList")
    public String roomList() {
        return "";
    }

    // 채팅방에서 메세지 보내기
    @MessageMapping("/socket/sendMessage/{roomNumber}")
    @SendTo("/topic/message/{roomNumber}")
    public Message sendMessage(@DestinationVariable String roomNumber, Message message) {
        log.warn("방번호"+roomNumber+"채팅방 메시지"+message);
        chat.addMessageToChatHistory(roomNumber, message);
        return message;
    }

    // 채팅방에 입장 퇴장 메세지 보내기
    @MessageMapping("/socket/notification/{roomNumber}")
    @SendTo("/topic/notification/{roomNumber}")
    public Map<String, Object> notification(@DestinationVariable String roomNumber, Map<String, Object> chatingRoom) {
        log.warn("채팅방 입장 퇴장 메시지"+chatingRoom);
        return chatingRoom;
    }
}
