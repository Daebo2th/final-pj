<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="/">
                <i class="bi bi-grid"></i>
                <span>대시보드</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <li class="nav-heading">교육생 Pages</li>

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>일일과제</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/student/daily-task">
                        <i class="bi bi-circle"></i><span>일일과제 작성</span>
                    </a>
                </li>
                <li>
                    <a href="/student/daily-task-list">
                        <i class="bi bi-circle"></i><span>일일과제 목록</span>
                    </a>
                </li>
                <!-- <li>
                  <a href="components-badges.html">
                    <i class="bi bi-circle"></i><span>Badges</span>
                  </a>
                </li>
                <li>
                  <a href="components-breadcrumbs.html">
                    <i class="bi bi-circle"></i><span>Breadcrumbs</span>
                  </a>
                </li>
                <li>
                  <a href="components-buttons.html">
                    <i class="bi bi-circle"></i><span>Buttons</span>
                  </a>
                </li>
                <li>
                  <a href="components-cards.html">
                    <i class="bi bi-circle"></i><span>Cards</span>
                  </a>
                </li>
                <li>
                  <a href="components-carousel.html">
                    <i class="bi bi-circle"></i><span>Carousel</span>
                  </a>
                </li>
                <li>
                  <a href="components-list-group.html">
                    <i class="bi bi-circle"></i><span>List group</span>
                  </a>
                </li>
                <li>
                  <a href="components-modal.html">
                    <i class="bi bi-circle"></i><span>Modal</span>
                  </a>
                </li>
                <li>
                  <a href="components-tabs.html">
                    <i class="bi bi-circle"></i><span>Tabs</span>
                  </a>
                </li>
                <li>
                  <a href="components-pagination.html">
                    <i class="bi bi-circle"></i><span>Pagination</span>
                  </a>
                </li>
                <li>
                  <a href="components-progress.html">
                    <i class="bi bi-circle"></i><span>Progress</span>
                  </a>
                </li>
                <li>
                  <a href="components-spinners.html">
                    <i class="bi bi-circle"></i><span>Spinners</span>
                  </a>
                </li>
                <li>
                  <a href="components-tooltips.html">
                    <i class="bi bi-circle"></i><span>Tooltips</span>
                  </a>
                </li> -->
            </ul>
        </li><!-- End Components Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-journal-text"></i><span>일정관리</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/schedule">
                        <i class="bi bi-circle"></i><span>캘린더</span>
                    </a>
                </li>
                <li>
                    <a href="/student/todolist">
                        <i class="bi bi-circle"></i><span>ToDoList</span>
                    </a>
                </li>

            </ul>
        </li><!-- End Forms Nav -->

        <li class="nav-heading">교직원 Pages</li>

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-layout-text-window-reverse"></i><span>교육생 관리</span><i
                    class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/teacher/student-record">
                        <i class="bi bi-circle"></i><span>학생기록부</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="bi bi-circle"></i><span>교육생 평가</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Tables Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#class-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-layout-text-window-reverse"></i><span>CLASS 관리</span><i
                    class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="class-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/teacher/class-info">
                        <i class="bi bi-circle"></i><span>CLASS 조회</span>
                    </a>
                </li>
                <li>
                    <a href="/teacher/nogroupuser">
                        <i class="bi bi-circle"></i><span>CLASS 배정</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Tables Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-gem"></i><span>수업 관리</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/teacher/daily-task-check">
                        <i class="bi bi-circle"></i><span>일일과제 현황</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Icons Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#charts-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-bar-chart"></i><span>기타</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="charts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/class/${principal.groupSeq}/dataSharingRoom">
                        <i class="bi bi-circle"></i><span>자료 공유실</span>
                    </a>
                </li>
                <li>
                    <a href="/common/survey">
                        <i class="bi bi-circle"></i><span>만족도 조사</span>
                    </a>
                </li>
            </ul>
        </li>

        <li class="nav-heading">Pages</li>

        <li class="nav-item">
            <a class="nav-link collapsed" href="/student/MyPage">
                <i class="bi bi-person"></i>
                <span>Profile</span>
            </a>
        </li><!-- End Profile Page Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" href="/auth/logout">
                <i class="bi bi-box-arrow-in-right"></i>
                <span>Logout</span>
            </a>
        </li><!-- End Login Page Nav --><!-- End Blank Page Nav -->

    </ul>

</aside><!-- End Sidebar-->
</body>
</html>
