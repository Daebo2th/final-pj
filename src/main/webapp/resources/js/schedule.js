/* schedule.js */

var isAdm ="${isAdm}";
var edit = false;
if(isAdm==1) edit=true;

var diaLogOpt={
    modal:true        //모달대화상자
    ,resizable:false  //크기 조절 못하게
    , width : "570"   // dialog 넓이 지정
    , height : "470"  // dialog 높이 지정
};


// ====================== function ===============================
// calFunc[s]
var calFunc = {
    calcDate: function (arg, calendar) {
        var rObj = new Object();
        var start = null;
        var end = null;
        var allDay = arg.allDay;
        var startDisp = null;
        var endDisp = null;
        var userId = null;
        var xcontent = null;
        var title = null;
        var importance = null;

        // date get/set
        if (arg.id !== "" && arg.id !== null && arg.id !== undefined) id = arg.id;
        if(arg.title !== "" && arg.title !== null && arg.title!== undefined) title = arg.title;
        if(arg.extendedProps!==undefined){
            if(arg._def.extendedProps.xcontent !== "" && arg._def.extendedProps.xcontent !== null){
                xcontent = arg._def.extendedProps.xcontent;
            }
        }

        if(allDay) { // 하루종일
            var start = arg.start.toISOString().slice(0,10);
            var end = null;
            if(arg.end !== "" && arg.end !== null && arg.end !== undefined) {
                end = arg.end.toISOString().slice(0,10);  //실제 데이터는 날짜를 하루 빼지 않는다
            }
            if (start === end) end = null; // 같은 날일 경우 end 날짜 없음

            startDisp = start;
            if(end !== null) endDisp = dateRel(arg.end.toISOString().slice(0,10)); //알릴때만 날짜 하루 빼기
        } else { // 시간이 같이 들어올 경우
            start = arg.start.toISOString();
            if(arg.end !== "" && arg.end !== null && arg.end !== undefined){
                end   = arg.end.toISOString();
            }
            startDisp = returnCdate(calendar,arg.start);
            if(end!=null) endDisp = returnCdate(calendar,arg.end);
        }
        rObj.start = start;
        rObj.end = end;
        rObj.startDisp = startDisp;
        rObj.endDisp = endDisp;
        rObj.title = title;
        rObj.xcontent = xcontent;
        return rObj;
    },

    // 등록 초기
    setDateRangeView : function (xobj) {
        var dispStr = xobj.startDisp;
        if(xobj.endDisp !== null) dispStr += " ~ " + xobj.endDisp;

        $("form#diaForm").find("input[name='xdate']").val(dispStr);
        $("form#diaForm").find("input[name='start']").val(xobj.start);
        $("form#diaForm").find("input[name='end']").val(xobj.end);
        $("form#diaForm").find("input[name='actType']").val("C"); //등록
    },

    //form안에 name값을 $obj에 주입
    getFormValue :function(){
        var $dForm = $("form#diaForm");
        var $obj = new Object();
        $("form#diaForm").find("input,textarea,select").each(function(){
            var xval = $(this).val();
            $obj[$(this).attr("name")]=xval;
        });

        return $obj;
    },

    //모든 태그 비활성화
    formDsbTrue :function(){
        $("form#diaForm").find("input,textarea,select").each(function(){
            $(this).attr("disabled",true);
        });
    },


    //모든 태그 활성화
    formDsbFalse :function(){
        $("form#diaForm").find("input,textarea,select").each(function(){
            $(this).attr("disabled",false);
        });
    },

    // 데이터 조회
    setdataForm : function (xobj) {
        var dispStr = xobj.startDisp;
        if(xobj.endDisp !== null) dispStr += " ~ " + xobj.endDisp;

        $("form#diaForm").find("input[name='xdate']").val(dispStr);
        $("form#diaForm").find("input[name='start']").val(xobj.start);
        $("form#diaForm").find("input[name='end']").val(xobj.end);
        $("form#diaForm").find("input[name='actType']").val("U"); //수정

        $("form#diaForm").find("input[name='id']").val(xobj.id);
        $("form#diaForm").find("input[name='title']").val(xobj.title);
        $("form#diaForm").find("textarea[name='xcontent']").val(xobj.xcontent);
    }



};

// function formToJson(selector) {
//     var formData = $(selector).serializeArray();
//     var data = {};
//
//     for (var item of formData) {
//         data[item.name] = item.value;
//     }
//
//     return JSON.stringify(data);
// }

function registForm() {
    // 폼 데이터 객체 생성
    var scheduleForm = {};
    // 타입(C:등록, U:수정, D:삭제)
    scheduleForm.actType = $("#diaForm input[name='actType']").val();
    // 아이디
    scheduleForm.userId = $("#diaForm input[name='userId']").val();
    // 시작일
    scheduleForm.startDate = $("#diaForm input[name='startDate']").val();
    // 종료일
    scheduleForm.endDate = $("#diaForm input[name='endDate']").val();
    // 일정타입
    scheduleForm.type = $("#diaForm input[name='type']").val();
    // 제목
    scheduleForm.title = $("#diaForm input[name='title']").val();
    // 내용
    scheduleForm.importance = $("#diaForm select[name='importance']").val();
    // 시작일 ~ 종료일
    scheduleForm.xdate = $("#diaForm input[name='xdate']").val();
    // 내용
    scheduleForm.xcontent = $("#diaForm textarea[name='xcontent']").val();
    console.log(scheduleForm);
    return scheduleForm;

}

// 일정 등록
function createClnd(cal) {
    if(!confirm("일정을 등록하시겠습니까?")) return false;
    //var $obj = calFunc.getFormValue();
    $.ajax({
        url: "/adms/schedule/create",
        type: "POST",
        data: JSON.stringify(registForm()),
        contentType: "application/json;charset=UTF-8",
        dataType: 'json'
    }).done(function (data) {
        //var result = jQuery.parseJSON(data);
        console.log(data.status);
        alert("등록하였습니다.")
        //var title = data.title;
        // 모든 소스에서 이벤트를 다시 가져와 화면에 렌더링
        //cal.refetchEvents(title);
        location.href="/adms/schedule/main";
    }).fail(function (e) {
        alert("등록에 실패하였습니다.");
    }).always(function() {
        $("#name").val("");
        $("#comment").val("");
    })
}

//수정액션
function updateClnd(cal,xobj,event){
    if(!confirm("해당일정을 정말로 수정 하시겠습니까?")){
        if(event!=undefined) event.revert();
        return false;
    }
    var $obj = calFunc.getFormValue();

    $.ajax({
        url: "/adms/schedule/update",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        data:JSON.stringify($obj)
    }).done(function(data) {
        var result = jQuery.parseJSON();
        cal.refetchEvents();
    }).fail(function(e) {
        alert("실패하였습니다."+e);
    }).always(function() {
        $("#name").val("");
        $("#comment").val("");
    });
}

//삭제액션
function deleteClnd(cal,xobj){
    if(!confirm("해당일정을 정말로 삭제 하시겠습니까?")) return false;

    var $obj = calFunc.getFormValue();
    $.ajax({
        url: "/adms/schedule/delete",
        type: "POST",
        contentType: "application/json;charset=UTF-8",
        data:JSON.stringify($obj)
    }).done(function(data) {
        var result = jQuery.parseJSON(data);
        cal.refetchEvents();
    }).fail(function(e) {
        alert("실패하였습니다."+e);
    }).always(function() {
        $("#name").val("");
        $("#comment").val("");
    });
}

//관리자만 ,주,일 옵션 뷰
var rightm = "";
rightm+=',listWeek';

// FullCalendar 달력 생성
// DOMContentLoaded Event DOM Tree가 모두 로딩된 이후에 발생하는 이벤트
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth'+rightm
        },
        allDay:false,
        theme: true,
        themeSystem: 'bootstrap',
        locale:'ko',
        timeZone: 'Asia/Seoul',
        navLinks: true, // can click day/week names to navigate views
        selectable: true,
        selectMirror: true,

        select: function(arg) {

            if(isAdm==0) return false;
            var xObj = calFunc.calcDate(arg,calendar);     //get event data

            //================ dialog 옵션 추가 ===================
            var btnOpt ={
                "저장":function(){
                    createClnd(calendar);  //저장클릭시 액션 함수
                    $(this).dialog("close");
                },"취소":function(){
                    $(this).dialog("close");
                }
            }
            var dOpt =diaLogOpt;
            dOpt.buttons = btnOpt;
            $("#name").val("");
            $("#comment").val("");

            //================ dialog 옵션 추가 ===================
            calFunc.formDsbFalse();          //Form data disabeld false
            $('#dialog').dialog(dOpt);       //다이얼로그 오픈
            calFunc.setDateRangeView(xObj);  //SET Form data
            calendar.unselect();
        },


        //클릭 함수 [s]
        eventClick: function(calEvent, jsEvent) {

            var xObj = calFunc.calcDate(calEvent.event,calendar);  //get event data
            //================ dialog 옵션 추가 ===================
            var btnOpt ={
                "삭제":function(){
                    deleteClnd(calendar,xObj); //삭제클릭시 액션 함수
                    $(this).dialog("close");
                },"수정":function(){
                    updateClnd(calendar,xObj); //수정클릭시 액션 함수
                    $(this).dialog("close");
                },"닫기":function(){
                    $(this).dialog("close");
                }
            }
            //================ dialog 옵션 추가 ===================
            //======================관리자 =======================
            if(isAdm==1){
                calFunc.formDsbFalse(); //Form data disabeld false
            }else{
                calFunc.formDsbTrue();  //Form data disabeld true
                delete btnOpt['수정'];   //일반사용자 수정 히든 처리
                delete btnOpt['삭제'];   //일반사용자 삭제 히든 처리
            }
            //======================관리자 =======================

            //================ dialog 옵션 추가 ===================
            var dOpt = diaLogOpt;
            dOpt.buttons = btnOpt;
            //================ dialog 옵션 추가 ===================

            //================ 실행                      ===================
            $('#dialog').dialog(dOpt);  //다이얼로그 오픈
            calFunc.setDataForm(xObj);  //SET Form Data

            //================ 실행                      ===================

        },
        //클릭 함수 [e]


        editable: edit,  //관리자 외 false
        dayMaxEvents: true, // allow "more" link when too many events

    // {
    //     backgroundColor:'E9BFD1',
    //         textColor:'5D082D',
    //     title: '${list.title}',
    //     start: '<fmt:formatDate value="${list.startDate}" pattern="yyyy-MM-dd HH:mm" />',
    //     end: '<fmt:formatDate value="${list.endDate}" pattern="yyyy-MM-dd HH:mm" />',
    // },
    // {
    //     color: 'D8F0A0',
    //         textColor: '385000',
    //     title: '${list.title}',
    //     start: '<fmt:formatDate value="${list.startDate}" pattern="yyyy-MM-dd HH:mm" />',
    //     end: '<fmt:formatDate value="${list.endDate}" pattern="yyyy-MM-dd HH:mm" />',
    // }
    //


            // $.ajax({
            //     url: "/adms/schedule/main",
            //     type: "GET",
            //     data:param
            // }).done(function(data) {
            //     var result = jQuery.parseJSON(data);
            //     successCallback(result.list);
            // }).fail(function(e) {
            //     alert("실패하였습니다."+e);
            // }).always(function() {
            //
            // });


        //새로운 이벤트 데이터가 필요할 때마다 이 함수를 호출 (데이터 조회)
        events: function(fetchInfo, successCallback, failureCallback) {
            var start= fetchInfo.start.toISOString().slice(0, 7);
            var end = fetchInfo.end.toISOString().slice(0, 7);
            var param = "";
            param+="start="+start;
            param+="&end="+end;

            $.ajax({
                url: "/adms/schedule/main",
                type: "GET",
                data:param
            }).done(function(data) {
                var result = jQuery.parseJSON(data);
                successCallback(result.list);
            }).fail(function(e) {
                alert("실패하였습니다."+e);
            }).always(function() {

            });

        },

        eventDrop: function(info) {
            var xObj = calFunc.calcDate(info.event,calendar); //get event data
            calFunc.setDataForm(xObj);  //Set Form Data
            updateClnd(calendar,xObj,info);
        },
        eventResize: function(info) {
            var xObj = calFunc.calcDate(info.event,calendar); //get event data
            calFunc.setDataForm(xObj);  //Set Form Data
            updateClnd(calendar,xObj,info);
        },
        eventTimeFormat: {
            hour: '2-digit',
            minute: '2-digit',
            hour12: false
        },

    });

    calendar.render();

    $("span.fa-chevron-left").html("이전달");
    $("span.fa-chevron-right").html("다음달");
});

//특정일자 하루전
function dateRel(date){
    var selectDate = date.split("-");
    var changeDate = new Date();
    changeDate.setFullYear(selectDate[0], selectDate[1]-1, selectDate[2]-1);

    var y = changeDate.getFullYear();
    var m = changeDate.getMonth() + 1;
    var d = changeDate.getDate();

    if(m < 10) {
        m = "0" + m;
    }

    if(d < 10) {
        d = "0" + d;
    }
    var resultDate = y + "-" + m + "-" + d;
    return resultDate;
}

function returnCdate(cal,time){
    return cal.formatDate(time,{month: 'long',year: 'numeric',day: 'numeric', hour:'numeric',minute:'numeric', timeZone: 'Asia/Seoul',locale: 'ko'});
}

/*
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    // new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..})

    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        initialDate: '2021-04-12', // 초기 로딩 날짜.
        navLinks: true, // can click day/week names to navigate views
        selectable: true,
        selectMirror: true,
        // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
        select: function(arg) {
            console.log(arg);

            var title = prompt('입력할 일정:');
            var content = prompt('일정 내용:');
            var writer = prompt('작성자:');
            // title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
            if (title) {
                calendar.addEvent({
                    title: title,
                    content: content,
                    writer: writer,
                    start: arg.start,
                    end: arg.end,
                    allDay: arg.allDay,
                    backgroundColor:"yellow",
                    textColor:"blue",
                    borderColor: "black"
                })
            }
            calendar.unselect()
        },
        eventClick: function(arg) {
            // 있는 일정 클릭시,
            console.log("#등록된 일정 클릭#");
            console.log(arg.event);

            if (confirm('해당 일정을 삭제하시겠습니까?')) {
                arg.event.remove()
            }
        },
        editable: true,
        dayMaxEvents: true, // allow "more" link when too many events
        events:
        //================ ajax데이터 불러올 부분 =====================//
            {"list":[{
                    "id":1,
                    "groupId":null,
                    "title":"할일title",
                    "writer":null,
                    "content":null,
                    "start":"2021-05-01T00:00:00",
                    "end":"2021-05-03T00:00:00",
                    "allday":true,"textColor":"yellow",
                    "backgroundColor":"navy",
                    "borderColor":"navy"
                }]}
    });

    calendar.render();
});*/
