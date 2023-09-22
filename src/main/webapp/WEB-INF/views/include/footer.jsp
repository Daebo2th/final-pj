<%@ page pageEncoding="UTF-8" %>
<!-- ======= Footer ======= -->
<footer id="footer" class="footer">
    <div class="copyright">
        &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
</footer><!-- End Footer -->
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- sock js -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
<!-- STOMP -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/moment.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/chatting.js"></script>
<script>
    const info = (function () {
        let nickname = "${principal.name}";
        let roomNumber = "";

        const getNickname = function () {
            return nickname;
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
            getRoomNumber: getRoomNumber, setRoomNumber: setRoomNumber,
        }
    })();
</script>


