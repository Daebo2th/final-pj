<%--
  Created by IntelliJ IDEA.
  User: KOSA
  Date: 2023-09-06
  Time: 오전 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>일정관리</title>
    <!-- Load the jQuery library -->
<%--    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>--%>
<%--    <!-- Load the jQuery UI library -->--%>
<%--    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>--%>
<%--    &lt;%&ndash; fullcalendar API &ndash;%&gt;--%>
<%--    <script src="/resources/js/schedule.js"></script>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>--%>
<%--    &lt;%&ndash; CSS &ndash;%&gt;--%>
<%--    <link rel="stylesheet" href="/resources/css/calendar.css">--%>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Hello, world!</title>
    <!-- jquery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- moment.js -->
    <script src="/resources/js/moment.js"></script>
    <!-- fullcalendar CDN -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <!-- fullcalendar 언어 CDN -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <style>
        /* body 스타일 */
        html, body {
            overflow: hidden;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;
        }
        /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
        .fc-header-toolbar {
            padding-top: 1em;
            padding-left: 1em;
            padding-right: 1em;
        }
    </style>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <h1>일정관리</h1>
    <div id="contents">
        <div id='calendar'></div>
        <%-- modal 추가--%>
            <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">일정 생성</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <input type="hidden" name="actType" value="C" /> <!-- C:등록 U:수정 D:삭제 -->
                                <input type="hidden" name="userId" value="qwe" />
                                <input type="hidden" name="scheduleSeq" id="schedule_seq"  />

                                <%--@declare id="taskid"--%>
                                <label for="taskId" class="col-form-label">제목</label>
                                <input type="text" class="form-control" id="calendar_content" name="title" placeholder="제목을 입력하세요">
                                <label for="taskId" class="col-form-label">중요도</label>
                                <select name="importance" id="importance">
                                    <option value="up">상</option>
                                    <option value="mid">중</option>
                                    <option value="bottom">하</option>
                                </select>
                                <textarea name="xcontent" class="form-control" id="xcontent" cols="30" rows="10" placeholder="내용을 입력하세요."></textarea>
                                <label for="taskId" class="col-form-label">시작 날짜</label>
                                <input type="datetime-local" class="form-control" id="calendar_start_date" name="startDate" value="">
                                <label for="taskId" class="col-form-label">종료 날짜</label>
                                <input type="datetime-local" class="form-control" id="calendar_end_date" name="endDate" value="">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-warning" id="addCalendar" onclick="addBtn()">추가</button>
                            <button type="button" class="btn btn-warning" id="delCalendar" onclick="delBtn()" style="display: none">삭제</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                    id="sprintSettingModalClose" onclick="cancelBtn()">취소</button>
                        </div>

                    </div>
                </div>
            </div>



    </div>
    <script>
        function cancelBtn() {
            // 입력 필드들의 값을 초기화
            $("#calendar_content").val("");
            $("#xcontent").val("");
            $("#importance").val("up");
            $("#schedule_seq").val("");
            $("#calendar_start_date").val("");
            $("#calendar_end_date").val("");

            // 모달 창 닫기
            $('#calendarModal').modal('hide');
        }

        function delBtn() {
            var scheduleSeq = $(".form-group input[name='scheduleSeq']").val();
            $.ajax({
                url: "/schedule/delete",
                type: "POST",
                data: scheduleSeq,
                contentType: "text/plain",
                dataType: "json",
                success: function (response) {
                    alert("삭제되었습니다");
                    $("#calendarModal").modal("hide");
                    location.href="/schedule/main";
                },
                error: function(xhr, status, error) {
                    // 요청이 실패했을 때의 처리 로직
                    console.error(error); // 에러 메시지 출력
                    // 추가적인 로직 구현 가능
                }
            })
        }

        function updateBtn() {
            var formData = {};
            formData.user_id = $(".form-group input[name='userId']").val();
            formData.scheduleSeq= $(".form-group input[name='scheduleSeq']").val();
            formData.actType = $(".form-group input[name='actType']").val();
            formData.title = $(".form-group input[name='title']").val();
            formData.startDate = $(".form-group input[name='startDate']").val();
            formData.endDate = $(".form-group input[name='endDate']").val();
            formData.xcontent = $(".form-group textarea[name='xcontent']").val();
            formData.importance = $(".form-group select[name='importance']").val();

            $.ajax({
                url: "/schedule/update", // 요청을 보낼 URL
                type: "POST", // HTTP 메서드 (GET, POST, PUT, DELETE 등)
                data: JSON.stringify(formData),
                contentType: "application/json",
                dataType: "json", // 응답 데이터 타입 (json, xml, text 등)
                success: function(response) {
                    // 요청이 성공했을 때의 처리 로직
                    console.log(response); // 응답 데이터 출력
                    // 추가적인 로직 구현 가능
                    alert("등록이 완료되었습니다.");
                    $("#calendarModal").modal("hide");
                    location.href="/schedule/main";
                },
                error: function(xhr, status, error) {
                    // 요청이 실패했을 때의 처리 로직
                    console.error(error); // 에러 메시지 출력
                    // 추가적인 로직 구현 가능
                }
            });
        }

        function addBtn(){
            // 폼 데이터 객체 생성
            var formData = {};
            formData.user_id = $(".form-group input[name='userId']").val();
            formData.scheduleSeq= $(".form-group input[name='scheduleSeq']").val();
            formData.actType = $(".form-group input[name='actType']").val();
            formData.title = $(".form-group input[name='title']").val();
            formData.startDate = $(".form-group input[name='startDate']").val();
            formData.endDate = $(".form-group input[name='endDate']").val();
            formData.xcontent = $(".form-group textarea[name='xcontent']").val();
            formData.importance = $(".form-group select[name='importance']").val();


            $.ajax({
                url: "/schedule/create", // 요청을 보낼 URL
                type: "POST", // HTTP 메서드 (GET, POST, PUT, DELETE 등)
                data: JSON.stringify(formData),
                contentType: "application/json",
                dataType: "json", // 응답 데이터 타입 (json, xml, text 등)
                success: function(response) {
                    // 요청이 성공했을 때의 처리 로직
                    console.log(response); // 응답 데이터 출력
                    // 추가적인 로직 구현 가능
                    alert("등록이 완료되었습니다.");
                    $("#calendarModal").modal("hide");
                    location.href="/schedule/main";
                },
                error: function(xhr, status, error) {
                    // 요청이 실패했을 때의 처리 로직
                    console.error(error); // 에러 메시지 출력
                    // 추가적인 로직 구현 가능
                }
            });
        }
        (function(){


            $(function(){
                // calendar element 취득
                var calendarEl = $('#calendar')[0];
                // full-calendar 생성하기
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    height: '700px', // calendar 높이 설정
                    expandRows: true, // 화면에 맞게 높이 재설정
                    //slotMinTime: '08:00', // Day 캘린더에서 시작 시간
                    //slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
                    // 해더에 표시할 툴바
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                    },
                    initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                    //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
                    slotMinTime: '00:00', // 최소 시간 설정 (오전 9시)
                    slotMaxTime: '23:59', // 최대 시간 설정 (오후 5시)
                    navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
                    editable: true, // 수정 가능?
                    selectable: true, // 달력 일자 드래그 설정가능
                    nowIndicator: true, // 현재 시간 마크
                    dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
                    locale: 'ko', // 한국어 설정
                    eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
                        console.log(obj);
                    },
                    eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
                        console.log(obj);
                        alert(obj);
                    },
                    eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
                        console.log(obj);
                    },
                    select: function(info) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
                        var eventObj = info.event;
                        $("#calendar_content").val(info.title);
                        console.log(info.startStr);
                        console.log(moment(info.startStr).format('yyyy-MM-DD hh:mm'));
                        console.log(info.view);
                        // $("#calendar_imp").val(eventObj.importance);
                        // $("#calendar_content").val(eventObj.xcontent);
                        $("#calendar_start_date").val(moment(info.startStr).format('yyyy-MM-DD hh:mm'));
                        $("#calendar_end_date").val(moment(info.endStr).format('yyyy-MM-DD hh:mm'));

                        // 종료일에서 하루 빼기
                        var endMoment = moment(info.endStr).subtract(1, 'days');

                        $("#calendar_end_date").val(endMoment.format('yyyy-MM-DD hh:mm'));

                        $("#calendarModal").modal("show"); // modal 나타내기

                    },

                    dateClick: function(info) { // 캘린더 날짜 클릭시 이벤트 생성
                        $("#calendarModal").modal("show"); // modal 나타내기

                    },

                    eventClick: function (info) { //이벤트 클릭시 모달창 나타내기
                        $("#addCalendar").removeAttr("onclick");   // 온클릭 속성을 삭제
                        $("#addCalendar").removeAttr("value");   // 온클릭 속성을 삭제
                        $("#addCalendar").text("수정");
                        $("#addCalendar").attr("onclick", "updateBtn();"); // 온클릭 속성을 다시부여
                        $("#delCalendar").show(); // 삭제 버튼 보이기하기
                        // 클릭된 이벤트 정보 가져오기
                        var eventObj = info.event;
                        // 모달에 값 설정하기
                        console.log(eventObj._def.extendedProps.extendsProps.scheduleSeq)
                        $("#calendar_content").val(eventObj.title);
                        $("#xcontent").val(eventObj._def.extendedProps.extendsProps.xcontent);
                        $("#importance").val(eventObj._def.extendedProps.extendsProps.importance);
                        $("#schedule_seq").val(eventObj._def.extendedProps.extendsProps.scheduleSeq);
                        $("#calendar_start_date").val(moment(eventObj.startStr).format('yyyy-MM-DD hh:mm'));
                        $("#calendar_end_date").val(moment(eventObj.endStr).format('yyyy-MM-DD hh:mm'));
                        console.log(eventObj.startStr)

                        // 추가로 저장해야 할 다른 데이터가 있다면 여기에 코드 작성

                        // 모달 나타내기
                        $("#calendarModal").modal("show");

                        // 수정 버튼이 클릭되었을 때의 동작 정의
                        $("#addCalendar").off().on("click", function() {
                            eventObj.setProp('title', $("#calendar_content").val());
                            eventObj.setDates($("#calendar_start_date").val(), $("#calendar_end_date").val());
                            $("#calendarModal").modal("hide");
                        });
                        //info.event.title // modal 나타내기
                    },
                    eventDrop:function(info) {
                        // 이벤트가 드래그 앤 드롭하여 변경될 때 호출되는 콜백 함수
                        var event = info.event;
                        console.log(event)
                        var formData = {};
                        formData.scheduleSeq = event._def.extendedProps.extendsProps.scheduleSeq;
                        formData.startDate = event.start.toISOString()
                        formData.endDate = event.end.toISOString()
                        console.log(formData)

                        $.ajax({
                            url: "/schedule/updateByDrop",
                            type: "POST",
                            data: JSON.stringify(formData),
                            contentType: "application/json",
                            dataType: "json",
                            success: function (response) {
                                alert("수정되었습니다");
                                //location.href="/schedule/main";
                            },
                            error: function(xhr, status, error) {
                                // 요청이 실패했을 때의 처리 로직
                                console.error(error); // 에러 메시지 출력
                                // 추가적인 로직 구현 가능
                            }
                        })
                    },

                    events: [
                        <c:forEach var="userlist" items="${list}">
                        {
                            color:'E9BFD1',
                            textColor:'5D082D',
                            title: '${userlist.title}',
                            start: '<fmt:formatDate value="${userlist.startDate}" pattern="yyyy-MM-dd HH:mm" />',
                            end: '<fmt:formatDate value="${userlist.endDate}" pattern="yyyy-MM-dd HH:mm" />',
                            extendsProps: {
                                xcontent:'${userlist.xcontent}',
                                importance:'${userlist.importance}',
                                scheduleSeq:'${userlist.scheduleSeq}',

                            }
                        },

                        </c:forEach>
                    ]
                });
                // 캘린더 랜더링
                calendar.render();
            });
        })();

    </script>

</body>
</html>
