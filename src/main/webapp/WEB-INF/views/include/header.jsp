<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

  <div class="d-flex align-items-center justify-content-between">
    <a href="" class="logo d-flex align-items-center">
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

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
          <li class="dropdown-header">
            You have 2 new messages
            <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="message-item">
            <a href="#">
              <img src="${pageContext.request.contextPath}/resources/img/messages-1.jpg" alt="" class="rounded-circle">
              <div>
                <h4>발신자</h4>
                <p>혁진아 담배 좀 줄여라!</p>
                <p>4 hrs. ago(메시지 온 시간)</p>
              </div>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="message-item">
            <a href="#">
              <img src="${pageContext.request.contextPath}/resources/img/messages-2.jpg" alt="" class="rounded-circle">
              <div>
                <h4>발신자</h4>
                <p>프로젝트 힘들어</p>
                <p>6 hrs. ago(메시지 온 시간)</p>
              </div>
            </a>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li class="dropdown-footer">
            <a href="#">Show all messages</a>
          </li>

        </ul><!-- End Messages Dropdown Items -->

      </li><!-- End Messages Nav -->

      <li class="nav-item dropdown pe-3">

        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
          <img src="${pageContext.request.contextPath}/resources/img/profile-img.jpg" alt="Profile" class="rounded-circle">
          <span class="d-none d-md-block dropdown-toggle ps-2">이름</span>
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
            <a class="dropdown-item d-flex align-items-center" href="#">
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
