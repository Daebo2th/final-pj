window.onload = function(){
	
	var cards = document.querySelectorAll('.card'); 		//.card를 가진 elements 배열
	var dropzones = document.querySelectorAll('.dropzone');	//.dropzone을 가진 elements 배열
	// cards.forEach(function(card){})
	// 와 같은 함수를 Arrow Function으로..
	
	// https://yuddomack.tistory.com/entry/%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8-Array-forEach
	// forEach문 -> JS Ex43_..
	// drag할 card들 event attach
	cards.forEach(card => {
		card.addEventListener("dragstart", dragStart);
		card.addEventListener("drag", drag);				// drag 여러번 발생
		card.addEventListener("dragend", dragEnd);
	});
	
	/*---------- .card : Drag 요소 함수들 ----------*/ 
	
	function dragStart(){
		//console.log("카드 : dragstart" );
		dropzones.forEach(dropzone => dropzone.classList.add("highlight"));
		
		// this = card
		this.classList.add('is-dragging');
	}
	
	function drag(){
		//console.log("카드 : dragging" );
		// this = card
	}
	
	function dragEnd(e) {
  //console.log($(this).parent().data("zone"));
  console.log($(this).index());
  //console.log($(this).parent().length);
  var content = this.querySelector('.content').textContent;
  //console.log(e)
  var cardNum = $(e.target).find("input[type=hidden]").val();
  var cardTaxis = $(this).index();
  //console.log(cardNum);
  
  // AJAX 요청 보내기
$.ajax({
  url: '/cardTaxisUpdate',
  method: 'POST',
  data: JSON.stringify({ "listNum" : $(this).parent().data("zone"), "cardNum" : cardNum, "cardTaxis" : cardTaxis}),
  
  contentType: 'application/json', // JSON 형식으로 데이터 전송
  success: function(response) {
    console.log('AJAX 요청 성공:', response);
    // 성공한 경우 추가적인 처리 로직 작성
    
  },
  error: function(xhr, status, error) {
    console.error('AJAX 요청 실패:', error);
    // 실패한 경우 에러 처리 로직 작성
  }
});

  dropzones.forEach(dropzone => dropzone.classList.remove("highlight"));
  
  // this = card
  this.classList.remove('is-dragging');
}

	
	
	
	dropzones.forEach(dropzone => {
		dropzone.addEventListener("dragenter", dragEnter);
		dropzone.addEventListener("dragover", dragOver);	// dragOver 여러번 발생
		dropzone.addEventListener("dragleave", dragLeave);
		dropzone.addEventListener("drop", drop);
	});
	
	/*---------- .dropzone : Drop 요소 함수들 ----------*/
	
	function dragEnter(){
		//console.log("드랍 : dragEnter");
		//this = dropzone
	}
	
	function dragOver(){
		//console.log("드랍 : dragOver");
		//this = dropzone
		//console.log(this);
		this.classList.add('dragover');
		
		var cardOn = document.querySelector(".is-dragging");	// drag중인 단일 card
		
		this.appendChild(cardOn);
	}
	
	function dragLeave(){
		//console.log("드랍 : dragLeave");
		this.classList.remove('dragover');
		
		//this = dropzone
	}
	
	function drop(){
		//console.log("드랍 : drop");
		//this = dropzone
		console.log(this.classList);
		this.classList.remove('dragover');
	}
}