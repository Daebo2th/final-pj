<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2023-09-09
  Time: PM 3:47
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <!-- 아이콘 -->
  <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
    <symbol id="people-circle" viewBox="0 0 16 16">
      <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
      <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
    </symbol>
    <svg id="bi bi-bell" viewBox="0 0 16 16">
      <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
    </svg>
    <svg id="bi bi-chat-dots" viewBox="0 0 16 16">
      <path d="M5 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm4 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm3 1a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
      <path d="m2.165 15.803.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125zm.8-3.108a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2z"/>
    </svg>
  </svg>
  <title>교직원 Layout</title>
  <style type="text/css">
    body, html {
      margin: 0;
      padding: 0;
      width:100%;
      height:100%;
    }
    #wrap{
      width:100%;
      height:auto; /* 높이를 auto로 변경 */
      font-size:40px;
      color:#fff3cd;
    }
    .side{
      float:left;
      width :240px; /* side 너비를 px 단위로 변경 */
      height :100vh; /* vh 단위로 변경하여 전체 화면에 꽉 차게 설정 */
      line-height:normal;
      /*background-color:#0f5132;*/
    }
    .header{
      float:left;
      width :calc(100% - 240px); /* header 너비를 계산식으로 변경 */
      height :7vh; /* vh 단위로 변경하여 전체 화면의 일부만 차지하도록 설정 */
      line-height:normal;
      background-color:rgba(0,91,35);
    }
    .contents{
      float:left;
      width :calc(100% - 240px); /* contents 너비를 계산식으로 변경 */
      height :92vh; /* vh 단위로 변경하여 전체 화면의 나머지 부분을 차지하도록 설정 */
      line-height:normal;
      background-color:#cfe2ff;
    }
    svg {
      fill: white;
    }
  </style>
  <link rel="stylesheet" href="/resources/css/Layout.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
<div id="wrap">
  <div class="side">
    <nav id="sidebar">
<%--      <div class="custom-menu">
        <button type="button" id="sidebarCollapse" class="btn btn-primary">
          &lt;%&ndash;<i class="fa fa-bars"></i>&ndash;%&gt; ▷
          <span class="sr-only">Toggle Menu</span>
        </button>
      </div>--%>
      <div class="p-4 pt-5">
        <h1><img src="/resources/images/Dailylogo.png" width="180"></h1>
        <ul class="list-unstyled components mb-5">
          <li class="active">
            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" <%--class="dropdown-toggle"--%>>Menu</a>
          </li>
          <p></p>
          <li>
            <a href="#taskSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">수업 관리</a>
            <ul class="collapse list-unstyled" id="taskSubmenu">
              <li>
                <a href="#">일일과제 현황</a>
              </li>
              <li>
                <a href="#">자료 공유실</a>
              </li>
            </ul>
          </li>
          <p></p>

          <li>
            <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">교육생 관리</a>
            <ul class="collapse list-unstyled" id="pageSubmenu">
              <li>
                <a href="#">학생 기록부</a>
              </li>
              <li>
                <a href="#">교육생 평가</a>
              </li>
            </ul>
          </li>
          <p></p>
          <li>
            <!-- <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">기타</a> -->
            <a href="#etcSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">일정 관리</a>
            <ul class="collapse list-unstyled" id="etcSubmenu">
              <li>
                <a href="#">캘린더</a>
              </li>
              <li>
                <a href="#">To Do List</a>
              </li>

            </ul>
          </li>
        </ul>
      <%--  <div class="footer">
          <img src="/resources/images/5sundosun.png" width="200">
        </div>--%>

      </div>
    </nav>

    <%--End Sidebar--%>
  </div>

  <div class="header">
    <div id = headerMenu>
      <div class="px-3 py-2 text-bg-dark border-bottom">
        <div class="container">
          <div id="headerLocation">
<%--            <a href="/" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
              <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
            </a>--%>

            <ul class="nav col-12 col-lg-auto my-2 justify-content-end my-md-0 text-small">
              <li>
                <a href="#" class="nav-link text-white">
                  <svg class="bi d-block mx-auto mb-1" width="40" height="40"><use xlink:href="#bi bi-bell"/></svg>
                </a>
              </li>
              <li>
                <a href="#" class="nav-link text-white">
                  <svg class="bi d-block mx-auto mb-1" width="40" height="40"><use xlink:href="#bi bi-chat-dots"/></svg>
                </a>
              </li>
              <li>
                <a href="#" class="nav-link text-white">
                  <svg class="bi d-block mx-auto mb-1" width="40" height="40"><use xlink:href="#people-circle"/></svg>
                </a>
              </li>
              <li>
                ${userId}교직원
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div> <%--header 끝--%>

  <%--들어갈 내용 --%>
  <div class="contents">Contents</div>
</div>
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="/resources/js/menu.js"></script>
</body>
</html>
