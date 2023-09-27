<%@ page pageEncoding="UTF-8" %>
<!-- ======= Footer ======= -->
<footer id="footer" class="footer">
    <div class="copyright">
        &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
</footer><!-- End Footer -->
<!-- sock js -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<!-- STOMP -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/moment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/chatting.js"></script>
<script>
    const info = (function () {
        let nickname = "${principal.name}";
        let roomNumber = "";
        let groupSeq = "${principal.groupSeq}"
        const getNickname = function () {
            return nickname;
        }

        const getGroupSeq = function (){
            return groupSeq;
        }

        // const setNickname = function (set) {
        //   nickname = set;
        // }

        const getRoomNumber = function () {
            return roomNumber;
        }

        const setRoomNumber = function (set) {
            roomNumber = set;
        }
        return {
            getNickname: getNickname, // setNickname: setNickname,
            getRoomNumber: getRoomNumber, setRoomNumber: setRoomNumber, getGroupSeq
        }
    })();
</script>

