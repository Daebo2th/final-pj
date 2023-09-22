<%@ page language="java" pageEncoding="UTF-8" %>
<%--채팅 드롭다운 시작--%>
<div class="page-content page-container dropdown-menu dropdown-menu-end dropdown-menu-arrow messages"
     onclick="event.stopPropagation();" id="page-content">
    <div id="custom-chat-container">
        <div class="container d-flex justify-content-center">
            <div class="col">
                <!-- 채팅방 목록 -->
                <div class="chat-room-list">
                    <h1>채팅방</h1>
                    <button class="new_chat">새 채팅방 만들기</button>
                    <nav>
                        <span>방 제목</span>
                        <span>인원</span>
                    </nav>
                    <hr>

                    <ul>
                        <li>
                            <!--
                                <span class="chat_title"></span>
                                <span class="chat_count"></span>
                                 -->
                        </li>
                    </ul>
                </div>
                <%-- 채팅 목록 끝 --%>
                <div class="card card-bordered chat">
                    <div class="card-header">
                        <h4 class="card-title"><strong>Chat</strong></h4>
                        <a class="btn btn-xs btn-secondary chat_back" href="#" data-abc="true">채팅방 나가기</a>
                    </div>


                    <%-- 남의꺼 --%>
                    <div class="ps-container ps-theme-default ps-active-y" id="chat-content"
                         style="overflow-y: scroll !important; height:400px !important;">
                        <%--                    <div class="media media-chat">--%>
                        <%--                      <div>--%>
                        <%--                        <img class="avatar" src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">--%>
                        <%--                        <span>name</span>--%>
                        <%--                      </div>--%>
                        <%--                      <div class="media-body">--%>
                        <%--                        <p>message</p>--%>
                        <%--                        <p class="meta"><time datetime="2018">23:58</time></p>--%>
                        <%--                      </div>--%>
                        <%--                    </div>--%>

                        <%--                    &lt;%&ndash;                    <div class="media media-meta-day">Today</div>&ndash;%&gt;--%>

                        <%-- 자기꺼 --%>
                        <%--                    <div class="media media-chat media-chat-reverse">--%>
                        <%--                      <div class="media-body">--%>
                        <%--                        <p>message</p>--%>
                        <%--                        <p>Long time no see! Tomorrow office. will be free on sunday.</p>--%>
                        <%--                        <p class="meta"><time datetime="2018">00:06</time></p>--%>
                        <%--                      </div>--%>
                        <%--                    </div>--%>


                        <div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;">
                            <div class="ps-scrollbar-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                        </div>
                        <div class="ps-scrollbar-y-rail" style="top: 0px; height: 0px; right: 2px;">
                            <div class="ps-scrollbar-y" tabindex="0" style="top: 0px; height: 2px;"></div>
                        </div>
                    </div>

                    <div class="publisher bt-1 border-light">
                        <img class="avatar avatar-xs"
                             src="https://img.icons8.com/color/36/000000/administrator-male.png" alt="...">
                        <textarea class="publisher-input" placeholder="Write something"></textarea>
                        <span class="publisher-btn file-group">
                  <i class="bi bi-paperclip"></i>
                  <input type="file">
                </span>
                        <a class="publisher-btn text-info" href="#" data-abc="true"><i
                                class="ri-send-plane-fill"></i></a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>