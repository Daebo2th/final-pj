<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>To Do List</title>
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/todolist.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/todolist.css">
<link
	href="https://fonts.googleapis.com/css2?family=Turret+Road:wght@300;400;500;700;800&display=swap"
	rel="stylesheet">

<!-- 폰트 -->
</head>
<body>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<div class="boards">
		<!-- ToDo List 존 -->
		<div class="board">
			<h3>To Do List</h3>
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-outline-success" data-toggle="modal"
				data-target="#insertModal">추가</button>
			<div class="dropzone" data-zone="1">
				<c:forEach items="${list }" var="list">
					<c:if test="${list.listNum == 1 }">

						<div class="card" draggable="true">
							<div class="status green"></div>
							<div class="content">${list.cardName }</div>
							<input type="hidden" value="${list.cardNum} ">
							<!-- Button 수정 modal -->
							<button type="button" class="btn btn-primary update-btn"
								data-toggle="modal" data-target="#updateModal"
								data-cardnum="${list.cardNum}" data-cardname="${list.cardName}">수정</button>


							<button type="button" class="btn btn-danger delete-btn"
								data-cardnum="${list.cardNum}">삭제</button>

						</div>

					</c:if>
				</c:forEach>

			</div>
		</div>
		<!-- In Progress 존 -->

		<div class="board">
			<h3>In Progress</h3>
					<!-- Button trigger modal -->
			<button type="button" class="btn btn-outline-success" data-toggle="modal"
				data-target="#insertModal">추가</button>
			<div class="dropzone" data-zone="2">
				<c:forEach items="${list }" var="list">
					<c:if test="${list.listNum == 2 }">

						<div class="card" draggable="true">
							<div class="status yellow"></div>
							<div class="content">${list.cardName }</div>
							<input type="hidden" class="cardNum" value="${list.cardNum} ">
							<!-- Button 수정 modal -->
							<button type="button" class="btn btn-primary update-btn"
								data-toggle="modal" data-target="#updateModal"
								data-cardnum="${list.cardNum}" data-cardname="${list.cardName}">수정</button>


							<button type="button" class="btn btn-danger delete-btn"
								data-cardnum="${list.cardNum}">삭제</button>

						</div>

					</c:if>
				</c:forEach>

			</div>
		</div>


		<!-- Done 존 -->

		<div class="board">
			<h3>Done</h3>
					<!-- Button trigger modal -->
			<button type="button" class="btn btn-outline-success" data-toggle="modal"
				data-target="#insertModal">추가</button>
			<div class="dropzone" data-zone="3">
				<c:forEach items="${list }" var="list">
					<c:if test="${list.listNum == 3 }">

						<div class="card" draggable="true">
							<div class="status red"></div>
							<div class="content">${list.cardName }</div>
							<input type="hidden" value="${list.cardNum} ">
							<!-- Button 수정 modal -->
							<button type="button" class="btn btn-primary update-btn"
								data-toggle="modal" data-target="#updateModal"
								data-cardnum="${list.cardNum}" data-cardname="${list.cardName}">수정</button>


							<button type="button" class="btn btn-danger delete-btn"
								data-cardnum="${list.cardNum}">삭제</button>

						</div>

					</c:if>
				</c:forEach>

			</div>
		</div>
	<!-- "insertModal" -->
	<div class="modal fade" id="insertModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">To Do List 추가</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
						<input type="text" id="todolistInput" class="form-control"
							placeholder="입력하세요" aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon3" onclick="insertData()">Button</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- updateModal -->
	<div class="modal fade" id="updateModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">To Do List 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
						<input type="text" id="todolistUpdate" class="form-control"
							placeholder="입력하세요" aria-label="Recipient's username"
							aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="button"
								id="button-addon2" onclick="updateDate()">Button</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

<script>
	/* $(document).ready(function() {
	 $("#confirmButton").click(function() {
	 var content = $("#todolistInput").val();
	 console.log(content);
	 $.ajax({
	 url: "/insertToDoList",
	 type: "POST",
	 contentType: "application/json",
	 data: JSON.stringify(content),
	 success: function(response) {
	 console.log("요청이 성공했습니다.");
	 // 성공 시 수행할 동작을 여기에 작성하세요
	 },
	 error: function(xhr, status, error) {
	 console.error("요청이 실패했습니다. 오류:", error);
	 // 실패 시 수행할 동작을 여기에 작성하세요
	 }
	 });
	 });
	 }); */

	function insertData() {

		$.ajax({
			url : '/insertToDoList',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify({
				"cardName" : $("#todolistInput").val()
			}),
			success : function(response) {
				alert('등록완료')
				console.log('Data sent successfully!');
				location.href = "/student/todolist"
			},
			error : function(xhr, status, error) {
				console.error('Error occurred while sending data:', error);
			}
		});
	}

	$(".update-btn").click(function() {
		var cardNum = $(this).data('cardnum');
		var cardName = $(this).data('cardname');

		$('#updateModal').data('cardnum', cardNum);

		$('#todolistUpdate').val(cardName);
	});

	function updateDate() {
		var cardNum = $('#updateModal').data('cardnum');

		$.ajax({
			url : '/updateToDoList',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify({
				"cardName" : $("#todolistUpdate").val(),
				"cardNum" : cardNum
			}),
			success : function(response) {
				alert('수정완료')
				console.log('Data sent successfully!');
				location.href = "/student/todolist"
			},
			error : function(xhr, status, error) {
				console.error('Error occurred while sending data:', error);
			}
		});
	};

	$(".delete-btn").click(function() {
		var cardNum = $(this).data('cardnum');

		$.ajax({
			url : '/deleteToDoList',
			type : 'POST',
			contentType : 'application/json',
			data : JSON.stringify({
				"cardNum" : cardNum
			}),
			success : function(response) {
				alert('삭제완료')
				console.log('Data sent successfully!');
				location.href = "/student/todolist"
			},
			error : function(xhr, status, error) {
				console.error('Error occurred while sending data:', error);
			}
		});
	});
</script>
</html>