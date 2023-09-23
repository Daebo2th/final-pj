$(document).ready(function () {
    const socket = new SockJS('/websocket');
    const stomp = Stomp.over(socket);
    // stomp.debug = null; // stomp 콘솔출력 X

    // 방 목록 그리기
    const listHtml = function (roomList) {
        let listHtml = "";
        $.each(roomList, function (index, obj) {
            listHtml += `
				<li data-room_number=${obj.roomNumber}>
                    <span class="chat_title">${obj.roomName }</span>
                    <span class="chat_count">${obj.users.length}명</span>
	            </li>`;
        })


        $(".chat-room-list ul").html(listHtml);
    }


// 채팅방 목록 불러오기
    const chatingRoomList = function () {
        $.ajax({
            url: "/chatingRoomList", type: "GET",
        })
            .then(function (result) {
                listHtml(result)
            })
            .fail(function () {
                swal("에러가 발생했습니다");
            })
    }


// 구독을 취소하기위해 구독 시 아이디 저장
    const subscribe = [];

// 모든 구독 취소하기
    const subscribeCancle = function () {
        const length = subscribe.length;
        for (let i = 0; i < length; i++) {
            const sid = subscribe.pop();
            stomp.unsubscribe(sid.id);
        }
    }

// 메인 화면
    const main = function () {
        $(".chat-room-list").show();

        // 기존 구독 취소
        subscribeCancle();

        // 채팅 중이었던 방이 있을때
        const room = chatingRoom();

        if (room) {
            return;
        }

        const subscribeId = stomp.subscribe("/topic/roomList", function () {
            // "/topic/roomList"에서 메세지가 왔을때 실행할 함수
            chatingRoomList();
        });

        subscribe.push(subscribeId);
        chatingRoomList();
    };


    stomp.connect({}, function () {
        main();
    });
// ----------------- 채팅방 ---------------------------



    const errorMSG = function (result) {
        if (result.status == 404) {
            swal("종료되었거나 없는 방입니다")
        } else {
            swal("에러가 발생했습니다")
        }
        location.href = "/";
    }

// 참가자 그리기
    const userList = function (users) {
        $(".chat .chat_users .user").text(users.length + "명");

        let userHtml = "";
        for (let i = 0; i < users.length; i++) {
            userHtml += `
			<li>${users[i] }</li>`;
        }

        $(".chat .chat_nickname ul").html(userHtml);
    }

// 메세지 그리기
    const chating = function (messageInfo) {
        let nickname = messageInfo.nickname;
        let message = messageInfo.message;

        console.log(nickname)
        console.log(message)
        message = message.replaceAll("\n", "<br>").replaceAll(" ", "&nbsp");

        const date = messageInfo.date;
        const d = moment(new Date(date),"YYYYMMDD h:mm:ss a").format('LT');

        let chatHtml;
        if (info.getNickname() == nickname) {
            chatHtml = `
           <div class="media media-chat media-chat-reverse">
            <div class="media-body">
              <p>${message}</p>
              <p class="meta"><time datetime="2018">${d}</time></p>
            </div>
          </div>`;
        } else {
            chatHtml = `
          <div class="media media-chat">
            <div>
              <img class="avatar" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">
              <span>${nickname}</span>
            </div>
            <div class="media-body">
              <p>${message}</p>
              <p class="meta"><time datetime="2023">${d}</time></p>
            </div>
          </div>
          `;
        }


        // <li>
        //   <div>${message}</div>
        // </li>

        $(".chat .ps-container").append(chatHtml);

        $(".chat .ps-container").scrollTop($(".chat .ps-container")[0].scrollHeight);
    }

// 채팅방 구독
    const chatingConnect = function (roomNumber) {
        // 기존 구독 취소
        subscribeCancle();

        // 메세지를 받을 경로
        const id1 = stomp.subscribe("/topic/message/" + roomNumber, function (result) {
            const message = JSON.parse(result.body);
            // 메세지가 왔을때 실행할 함수
            chating(message);
        })

        // 입장,퇴장 알림을 받을 경로
        const id2 = stomp.subscribe("/topic/notification/" + roomNumber, function (result) {
            const room = JSON.parse(result.body);
            const message = room.message;
            console.log(room)

            // 메세지가 왔을때 실행할 함수
            userList(room.users);

            const chatHtml = `
            <div class="notification" style="text-align: center">
                <span>&lt;&lt;${message}&gt;&gt;</span>
            </div>
	        `;

            $(".chat .ps-container").append(chatHtml);

            $(".chat .ps-container").scrollTop($(".chat .ps-container")[0].scrollHeight);

        })

        subscribe.push(id1);
        subscribe.push(id2);
    }

// 채팅방 세팅
    const initRoom = function (room) {
        // 방 목록 업데이트
        stomp.send("/socket/roomList");

        $(".chat-room-list").hide();

        info.setRoomNumber(room.roomNumber);

        $(".chat").show();
        $(".chat .card-title").html(`<strong>${room.roomName}</strong>`);

        userList(room.users);
        chatingConnect(room.roomNumber);

        $(".publisher textarea").focus();
    }

// 메세지 보내기
    const sendMessage = function () {
        const message = $(".publisher textarea");

        if (message.val() == "") {
            return;
        }

        const roomNumber = info.getRoomNumber();
        const nickname = info.getNickname();

        const data = {
            message: message.val(), nickname: nickname,
        }

        stomp.send("/socket/sendMessage/" + roomNumber, {}, JSON.stringify(data));
        message.val("");
    }

    $(".publisher-btn").click(function () {
        sendMessage();
        $(".publisher-input").focus();
    })


    $(".publisher-input").keypress(function (event) {
        console.log("asd")
        if (event.keyCode == 13) {
            if (!event.shiftKey) {
                event.preventDefault();

                sendMessage();
            }
        }
    })

// 채팅방 입장
    const enterChatingRoom = function (roomNumber) {

        swal({
            text: "방에 입장하시겠습니까?", buttons: ["취소", "확인"], closeOnClickOutside: false
        }).then(function () {
            const data = {
                roomNumber: roomNumber,
                nickname: info.getNickname()
            }

            $.ajax({
                url: "/chatingRoom-enter",
                type: "GET",
                data: data,
            })
            .then(function (room) {
                console.log(room)
                initRoom(room);

                // 기존 채팅 내역을 화면에 출력
                room.chatHistory.forEach(function (message) {
                    chating(message);
                });

                // 채팅방 참가 메세지
                room.message = info.getNickname() + "님이 참가하셨습니다";
                stomp.send("/socket/notification/" + roomNumber, {}, JSON.stringify(room));
                chatingConnect(roomNumber);
            })
            .fail(function (result) {
                errorMSG(result);
            })
        })


    }

    // 새 채팅방 만들기
    const createRoom = function (roomName) {
        const data = {
            roomName: roomName, nickname: info.getNickname()
        }

        $.ajax({
            url: "/chatingRoom", type: "POST", data: data,
        })
            .then(function (room) {
                initRoom(room)
            })
            .fail(function () {
                swal("에러가 발생했습니다");
            })

    }

    $(".new_chat").click(function () {
        swal({
            text: "방 이름을 입력해주세요", content: "input", buttons: ["취소", "확인"], closeOnClickOutside: false
        })
            .then(function (roomName) {
                if (roomName) {
                    createRoom(roomName);
                }
            })
    })

    $(document).on("dblclick", ".chat-room-list li", function () {
        const roomNumber = $(this).data("room_number");
        enterChatingRoom(roomNumber);
    })

// 채팅방 나가기
    $(".chat_back").click(function () {
        swal({
            text: "대화방에서 나갈까요?", buttons: ["취소", "확인"]
        })
            .then(function (result) {
                if (result) {
                    $.ajax({
                        url: "/chatingRoom-exit", type: "PATCH",
                    })
                        .then(function (room) {
                            const roomNumber = info.getRoomNumber();

                            if (room.users.length != 0) {
                                // 채팅방 나가기 메세지
                                room.message = info.getNickname() + "님이 퇴장하셨습니다";
                                stomp.send("/socket/notification/" + roomNumber, {}, JSON.stringify(room));
                            }

                            // 채팅방 목록 업데이트
                            stomp.send("/socket/roomList");

                            main();
                            $(".chat").hide();
                            $(".chat .ps-container").html("");

                            info.setRoomNumber("");
                        })
                        .fail(function () {
                            errorMSG();
                        })
                }
            })
    })

//대화 중이던 방
    const chatingRoom = function () {
        let returnRoom = null;

        $.ajax({
            url: "/chatingRoom", type: "GET", async: false,
        })
            .then(function (result) {
                if (result != "") {
                    const room = result.chatingRoom;
                    initRoom(room);
                    returnRoom = result;
                }
            })
            .fail(function (result) {
                errorMSG(result);
            })

        return returnRoom;
    };
}) // document.ready

