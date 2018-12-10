<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE htmlp>
<html>
<head>
<meta charset=UTF-8">
<title>1:1 채팅</title>
<style type="text/css">
	
</style>
</head>
<body>
	<h3>1:1 통신</h3>
	내 ID : <input id="chatId" size="10"><br>
	상대방 ID : <input id="recvUser" size="10"><br>
	<button id="startBtn">채팅하기</button>
	
	<!-- 채팅 구현 -->
	<div>
		<fieldset>
			<div id="messageWindow"></div><br>
			<input id="inputMessage" onkeyup="enterKey();">
			<input type="submit" value="보내기" onclick="send();">
			<input type="button" id="endBtn" value="나가기">
		</fieldset>
	</div>
<script type="text/javascript">
	//상대방과 연결을 위한 웹소켓 객체 생성
	var webSocket = null;
	
	//채팅창 부분의 내용
	var $textArea = $("#messageWindow");
	
	//전송할 문자열 기록
	var $inputMessge = $("#inputMessage");
	
	function connection() {
		//웹소켓 객체는 생성자를 통해 생성, 객체 생성시에 서버와 자동 연결
		
		webSocket = new WebSocket("ws://localhost:9000<%= request.getContextPath() %>/unicast");
		
		//웹소켓을 통해서 연결이 될 때 동작할 이벤트 핸들러
		webSocket.onopen = function(e) {
			$textArea.html("<p class='chat_content'>" + $("#chatId").val() + "님이 입장하였습니다.</p><br>");
			
			//웹소켓을 통해 채팅서버에 참여한 내용을 전송
			//보낼 때 send, 받을 때 message
			webSocket.send($("chatId").val() + "|님이 입장");
		};
		
		//서버로 부터 메제시 받을 때 동작하는 이벤트 핸들러
		webSocket.onmessage = function(e) {
			onMessage(e);
		};
		
		//서버로 메세지 보낼 때 에러 발생 처리용 이벤트 핸들러
		webSocket.onerror = function(e) {
			enError(e);
		};
	}
	
	//엔터키 누를 때 메세지 보내기
	function enterKey() {
		if(window.event.keyCode == 13) {
			send();
		}
	}
	
	function send() {
		//메세지 입력하지 않은 경우
		if($inputMessage.val() == "") {
			alert("전송할 메세지를 입력하세요.");
		} else {
			//메세지 입력
			$textArea.html($textArea.html() + "<p class='chat_content'>나 : " + $inputMessage.val() + "<p><br>");
			
			webSocket.send($("#chatId").val() + "|" + $inputMessage.val());
			$inputMessage.val('');
		}
		
		$textArea.scrollTop($textArea.height());
	}
	
	//서버로 부터 오는 메세지를 받을 때의 이벤트 핸들러 실행
	function onMessage(e) {
		var message = e.data.split("|");
		
		//보낸 아이디
		var sender = message[0];
		
		//전송온 메세지
		var content = message[1];
		
		//전달받은 글이 없거나, 보낸 사람이 내가 연결한 사람이 아니거나 할 경우 아무 내용도 실행하지 않는다.
		if(content == "" || !sender.match($("recvUser").val())) {
			
		} else {
			$textArea.html($textArea.html() + "<p class='chat_content other-side'>" + sender + " : " + content + "</p><br>");
			
			$textArea.scollTop($textArea.height());
		}
	}
	
	function onError(e) {
		alert(e.data);
	}
	
	function onClose(e) {
		alert(e);
	}
	
	$("#startBtn").on("click", function() {
		//접속하기 버튼 클릿기
		$("#chatbox").css("display", "block");
		$(this).css("display", "none");
		connection();
	});
	
	//나기기 버튼 클릭시 소켓 닫기
	$("endBtn").on("click", function() {
		$("chatbox").css("display", "none");
		$("#startBtn").css("display", "inline");
		webSocket.send($("#chatId").val() + " 님이 퇴장하였습니다.");
		webSocket.close();
	});
</script>
</body>
</html>