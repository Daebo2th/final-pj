<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
  <style>
    .card-bordered {
      border: 1px solid #ebebeb;
    }

    .card {
      border: 0;
      border-radius: 0px;
      margin-bottom: 30px;
      -webkit-box-shadow: 0 2px 3px rgba(0,0,0,0.03);
      box-shadow: 0 2px 3px rgba(0,0,0,0.03);
      -webkit-transition: .5s;
      transition: .5s;
    }

    .padding {
      padding: 3rem !important
    }

    body {
      background-color: #f9f9fa
    }

    .card-header:first-child {
      border-radius: calc(.25rem - 1px) calc(.25rem - 1px) 0 0;
    }


    .card-header {
      display: -webkit-box;
      display: flex;
      -webkit-box-pack: justify;
      justify-content: space-between;
      -webkit-box-align: center;
      align-items: center;
      padding: 15px 20px;
      background-color: transparent;
      border-bottom: 1px solid rgba(77,82,89,0.07);
    }

    .card-header .card-title {
      padding: 0;
      border: none;
    }

    h4.card-title {
      font-size: 17px;
    }

    .card-header>*:last-child {
      margin-right: 0;
    }

    .card-header>* {
      margin-left: 8px;
      margin-right: 8px;
    }

    .btn-secondary {
      color: #4d5259 !important;
      background-color: #e4e7ea;
      border-color: #e4e7ea;
      color: #fff;
    }

    .btn-xs {
      font-size: 11px;
      padding: 2px 8px;
      line-height: 18px;
    }
    .btn-xs:hover{
      color:#fff !important;
    }




    .card-title {
      font-family: Roboto,sans-serif;
      font-weight: 300;
      line-height: 1.5;
      margin-bottom: 0;
      padding: 15px 20px;
      border-bottom: 1px solid rgba(77,82,89,0.07);
    }


    .ps-container {
      position: relative;
    }

    .ps-container {
      -ms-touch-action: auto;
      touch-action: auto;
      overflow: hidden!important;
      -ms-overflow-style: none;
    }

    .media-chat {
      padding-right: 64px;
      margin-bottom: 0;
    }

    .media {
      padding: 16px 12px;
      -webkit-transition: background-color .2s linear;
      transition: background-color .2s linear;
    }

    .media .avatar {
      flex-shrink: 0;
    }

    .avatar {
      position: relative;
      display: inline-block;
      width: 36px;
      height: 36px;
      line-height: 36px;
      text-align: center;
      border-radius: 100%;
      background-color: #f5f6f7;
      color: #8b95a5;
      text-transform: uppercase;
    }

    .media-chat .media-body {
      -webkit-box-flex: initial;
      flex: initial;
      display: table;
    }

    .media-body {
      min-width: 0;
    }

    .media-chat .media-body p {
      position: relative;
      padding: 6px 8px;
      margin: 4px 0;
      background-color: #f5f6f7;
      border-radius: 3px;
      font-weight: 100;
      color:#9b9b9b;
    }

    .media>* {
      margin: 0 8px;
    }

    .media-chat .media-body p.meta {
      background-color: transparent !important;
      padding: 0;
      opacity: .8;
    }

    .media-meta-day {
      -webkit-box-pack: justify;
      justify-content: space-between;
      -webkit-box-align: center;
      align-items: center;
      margin-bottom: 0;
      color: #8b95a5;
      opacity: .8;
      font-weight: 400;
    }

    .media {
      padding: 16px 12px;
      -webkit-transition: background-color .2s linear;
      transition: background-color .2s linear;
    }

    .media-meta-day::before {
      margin-right: 16px;
    }

    .media-meta-day::before, .media-meta-day::after {
      content: '';
      -webkit-box-flex: 1;
      flex: 1 1;
      border-top: 1px solid #ebebeb;
    }

    .media-meta-day::after {
      content: '';
      -webkit-box-flex: 1;
      flex: 1 1;
      border-top: 1px solid #ebebeb;
    }

    .media-meta-day::after {
      margin-left: 16px;
    }

    .media-chat.media-chat-reverse {
      padding-right: 12px;
      padding-left: 64px;
      -webkit-box-orient: horizontal;
      -webkit-box-direction: reverse;
      flex-direction: row-reverse;
    }

    .media-chat {
      padding-right: 64px;
      margin-bottom: 0;
    }

    .media {
      padding: 16px 12px;
      -webkit-transition: background-color .2s linear;
      transition: background-color .2s linear;
    }

    .media-chat.media-chat-reverse .media-body p {
      float: right;
      clear: right;
      background-color: #48b0f7;
      color: #fff;
    }

    .media-chat .media-body p {
      position: relative;
      padding: 6px 8px;
      margin: 4px 0;
      background-color: #f5f6f7;
      border-radius: 3px;
    }


    .border-light {
      border-color: #f1f2f3 !important;
    }

    .bt-1 {
      border-top: 1px solid #ebebeb !important;
    }

    .publisher {
      position: relative;
      display: -webkit-box;
      display: flex;
      -webkit-box-align: center;
      align-items: center;
      padding: 12px 20px;
      background-color: #f9fafb;
    }

    .publisher>*:first-child {
      margin-left: 0;
    }

    .publisher>* {
      margin: 0 8px;
    }

    .publisher-input {
      -webkit-box-flex: 1;
      flex-grow: 1;
      border: none;
      outline: none !important;
      background-color: transparent;
    }

    button, input, optgroup, select, textarea {
      font-family: Roboto,sans-serif;
      font-weight: 300;
    }

    .publisher-btn {
      background-color: transparent;
      border: none;
      color: #8b95a5;
      font-size: 16px;
      cursor: pointer;
      overflow: -moz-hidden-unscrollable;
      -webkit-transition: .2s linear;
      transition: .2s linear;
    }

    .file-group {
      position: relative;
      overflow: hidden;
    }

    .publisher-btn {
      background-color: transparent;
      border: none;
      color: #cac7c7;
      font-size: 16px;
      cursor: pointer;
      overflow: -moz-hidden-unscrollable;
      -webkit-transition: .2s linear;
      transition: .2s linear;
    }

    .file-group input[type="file"] {
      position: absolute;
      opacity: 0;
      z-index: -1;
      width: 20px;
    }

    .text-info {
      color: #48b0f7 !important;
    }
  </style>
</head>
<body>
<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

  <div class="d-flex align-items-center justify-content-between">
    <a href="/" class="logo d-flex align-items-center">
      <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="">
      <span class="d-none d-lg-block">OSDS</span>
    </a>
    <i class="bi bi-list toggle-sidebar-btn"></i>
  </div><!-- End Logo -->

  <nav class="header-nav ms-auto">
    <ul class="d-flex align-items-center">
      <li class="nav-item d-block d-lg-none">
        <a class="nav-link nav-icon search-bar-toggle " href="#">
          <i class="bi bi-search"></i>
        </a>
      </li><!-- End Search Icon-->

      <li class="nav-item dropdown">

        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <i class="bi bi-bell"></i>
          <span class="badge bg-primary badge-number">알림 횟수</span>
        </a><!-- End Notification Icon -->

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
          <li class="dropdown-header">
            당신에게 2개의 알림이 왔습니다.
            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="notification-item">
            <i class="bi bi-exclamation-circle text-warning"></i>
            <div>
              <h4>공지사항</h4>
              <p>이곳은 오순도순 사이트입니다.(내용 1줄 정도 들어가는 부분)</p>
              <p>알림 온 시간</p>
            </div>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="notification-item">
            <i class="bi bi-x-circle text-danger"></i>
            <div>
              <h4>알림2</h4>
              <p>이곳은 오순도순 사이트입니다(내용))</p>
              <p>1 hr. ago</p>
            </div>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>
          <li class="dropdown-footer">
            <a href="#">전체보기(알림페이지 생성하는 경우 링크)</a>
          </li>

        </ul><!-- End Notification Dropdown Items -->

      </li><!-- End Notification Nav -->

      <li class="nav-item dropdown">

        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
          <i class="bi bi-chat-left-text"></i>
          <span class="badge bg-success badge-number">메시지 수</span>
        </a><!-- End Messages Icon -->

        <%--채팅 드롭다운 시작--%>
        <div class="page-content page-container dropdown-menu dropdown-menu-end dropdown-menu-arrow messages" id="page-content">
          <div>
            <div class="row container d-flex justify-content-center">
              <div class="col">
                <div class="card card-bordered">
                  <div class="card-header">
                    <h4 class="card-title"><strong>Chat</strong></h4>
                    <a class="btn btn-xs btn-secondary" href="#" data-abc="true">Let's Chat App</a>
                  </div>


                  <div class="ps-container ps-theme-default ps-active-y" id="chat-content" style="overflow-y: scroll !important; height:400px !important;">
                    <div class="media media-chat">
                      <img class="avatar" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">
                      <div class="media-body">
                        <p>Hi</p>
                        <p>How are you ...???</p>
                        <p>What are you doing tomorrow?<br> Can we come up a bar?</p>
                        <p class="meta"><time datetime="2018">23:58</time></p>
                      </div>
                    </div>

                    <div class="media media-meta-day">Today</div>

                    <div class="media media-chat media-chat-reverse">
                      <div class="media-body">
                        <p>Hiii, I'm good.</p>
                        <p>How are you doing?</p>
                        <p>Long time no see! Tomorrow office. will be free on sunday.</p>
                        <p class="meta"><time datetime="2018">00:06</time></p>
                      </div>
                    </div>

                    <div class="media media-chat">
                      <img class="avatar" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">
                      <div class="media-body">
                        <p>Okay</p>
                        <p>We will go on sunday? </p>
                        <p class="meta"><time datetime="2018">00:07</time></p>
                      </div>
                    </div>

                    <div class="media media-chat media-chat-reverse">
                      <div class="media-body">
                        <p>That's awesome!</p>
                        <p>I will meet you Sandon Square sharp at 10 AM</p>
                        <p>Is that okay?</p>
                        <p class="meta"><time datetime="2018">00:09</time></p>
                      </div>
                    </div>

                    <div class="media media-chat">
                      <img class="avatar" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">
                      <div class="media-body">
                        <p>Okay i will meet you on Sandon Square </p>
                        <p class="meta"><time datetime="2018">00:10</time></p>
                      </div>
                    </div>

                    <div class="media media-chat media-chat-reverse">
                      <div class="media-body">
                        <p>Do you have pictures of Matley Marriage?</p>
                        <p class="meta"><time datetime="2018">00:10</time></p>
                      </div>
                    </div>

                    <div class="media media-chat">
                      <img class="avatar" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">
                      <div class="media-body">
                        <p>Sorry I don't have. i changed my phone.</p>
                        <p class="meta"><time datetime="2018">00:12</time></p>
                      </div>
                    </div>

                    <div class="media media-chat media-chat-reverse">
                      <div class="media-body">
                        <p>Okay then see you on sunday!!</p>
                        <p class="meta"><time datetime="2018">00:12</time></p>
                      </div>
                    </div>

                    <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;"><div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps-scrollbar-y-rail" style="top: 0px; height: 0px; right: 2px;"><div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 2px;"></div></div></div>

                  <div class="publisher bt-1 border-light">
                    <img class="avatar avatar-xs" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">
                    <input class="publisher-input" type="text" placeholder="Write something">
                    <span class="publisher-btn file-group">
                  <i class="fa fa-paperclip file-browser"></i>
                  <input type="file">
                </span>
                    <a class="publisher-btn" href="#" data-abc="true"><i class="fa fa-smile"></i></a>
                    <a class="publisher-btn text-info" href="#" data-abc="true"><i class="fa fa-paper-plane"></i></a>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <%--채팅 드롭다운 끝--%>
<%--        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">--%>
<%--          <li class="dropdown-header">--%>
<%--            You have 2 new messages--%>
<%--            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>--%>
<%--          </li>--%>
<%--          <li>--%>
<%--            <hr class="dropdown-divider">--%>
<%--          </li>--%>

<%--          <li class="message-item">--%>
<%--            <a href="#">--%>
<%--              <img src="${pageContext.request.contextPath}/resources/img/messages-1.jpg" alt="" class="rounded-circle">--%>
<%--              <div>--%>
<%--                <h4>발신자</h4>--%>
<%--                <p>혁진아 담배 좀 줄여라!</p>--%>
<%--                <p>4 hrs. ago(메시지 온 시간)</p>--%>
<%--              </div>--%>
<%--            </a>--%>
<%--          </li>--%>
<%--          <li>--%>
<%--            <hr class="dropdown-divider">--%>
<%--          </li>--%>

<%--          <li class="message-item">--%>
<%--            <a href="#">--%>
<%--              <img src="${pageContext.request.contextPath}/resources/img/messages-2.jpg" alt="" class="rounded-circle">--%>
<%--              <div>--%>
<%--                <h4>발신자</h4>--%>
<%--                <p>프로젝트 힘들어</p>--%>
<%--                <p>6 hrs. ago(메시지 온 시간)</p>--%>
<%--              </div>--%>
<%--            </a>--%>
<%--          </li>--%>
<%--          <li>--%>
<%--            <hr class="dropdown-divider">--%>
<%--          </li>--%>

<%--          <li class="dropdown-footer">--%>
<%--            <a href="#">Show all messages</a>--%>
<%--          </li>--%>

<%--        </ul><!-- End Messages Dropdown Items -->--%>

      </li><!-- End Messages Nav -->

      <li class="nav-item dropdown pe-3">

        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
          <img src="${mypage.profile == null ? '/resources/img/profile-img.jpg':('https://osdsbucket.s3.amazonaws.com/osds/'+=mypage.userId += '/' += mypage.profile) }" alt="Profile" class="rounded-circle">
          <span class="d-none d-md-block dropdown-toggle ps-2">${mypage.name }</span>
        </a><!-- End Profile Iamge Icon -->

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
          <li class="dropdown-header">
            <h6>이름</h6>
            <span>학생 또는 교직원(유저타입)</span>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="/student/MyPage">
              <i class="bi bi-person"></i>
              <span>My Profile(마이페이지)</span>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="#">
              <i class="bi bi-box-arrow-right"></i>
              <span>Sign Out</span>
            </a>
          </li>

        </ul><!-- End Profile Dropdown Items -->
      </li><!-- End Profile Nav -->

    </ul>
  </nav><!-- End Icons Navigation -->

</header>
</body>
</html>
