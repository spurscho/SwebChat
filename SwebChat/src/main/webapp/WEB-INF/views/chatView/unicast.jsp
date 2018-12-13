<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js?${verQuery}"></script>
<!DOCTYPE htmlp>
<html>
<head>
<meta charset=UTF-8">
<title>1:1 채팅</title>
<style type="text/css">
	#messageWindow {
		background: LightSkyBlue;
		height: 300px;
		overflow: auto;
	}
	
	.chat_content {
		background: rgb(255, 255, 102);
		padding: 10px;
		border-radius: 10px;
		display: inline-block;
		position: relative;
		margin: 10px;
		float: right;
		clear: both;
	}
	
	.chat_content:after {
		content: '';
		position: absolute;
		right: 0;
		top: 50%;
		width: 0;
		height: 0;
		border: 20px solid transparent;
		border-left-color: rgb(255, 255, 102);
		border-right: 0;
		border-top: 0;
		margin-top: -3.5px;
		margin-right: -10px;
	}
	
	.other-side {
		background: white;
		float: left;
		clear: both;
	}
	
	.other-side:after {
		content: '';
		position: absolute;
		right: 0;
		top: 50%;
		width: 0;
		height: 0;
		border: 20px solid transparent;
		border-right-color: white;
		border-left: 0;
		border-top: 0;
		margin-top: -3.5px;
		margin-left: -10px;
	}
	
	#chatbox {
		display: none;
	}
	
	#inputMessage {
		width: 1000px;
		height: 50px;
		font-size: 18;
		
	}
</style>
</head>
<body>
	<h3>1:1 통신</h3>
	내 ID : ${ dto.id }<input type="hidden" id="chatId" size="10" value="${ dto.id }"><br>
	상대방 ID : ${ yourId } <input type="hidden" id="recvUser" size="10" value="${ yourId }"><br>
	<button id="startBtn">채팅하기</button>
	
	<!-- 채팅 구현 -->
	<div id="chatbox">
		<fieldset>
			<div id="messageWindow"></div><br>
			<input id="inputMessage"  >
			<input type="button" value="보내기" onclick="send();">
			<input type="button" id="endBtn" value="나가기">
			<form action="fileup" method="post" enctype="multipart/form-data" id="fileLoad">
				<input type="file" name="fileinput" id="fileinput">
			</form>
			
		</fieldset>
	</div>
<script type="text/javascript">
	//상대방과 연결을 위한 웹소켓 객체 생성
	var webSocket = null;
	
	//채팅창 부분의 내용
	var $textArea = $("#messageWindow");
	
	//전송할 문자열 기록
	var $inputMessage = $("#inputMessage");
	
	var str = "";
	
	var tf = "";
	var filen = "";
	
	function connection() {
		//웹소켓 객체는 생성자를 통해 생성, 객체 생성시에 서버와 자동 연결
		
		webSocket = new WebSocket("ws://192.168.0.82:8880<%= request.getContextPath() %>/unicast");
		
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
	
	function send() {
		//메세지 입력하지 않은 경우
		if($inputMessage.val() == "") {
			alert("전송할 메세지를 입력하세요.");
		} else if(str != "") {
			
			ajaxFile();
			
			str = "";
			
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
		
		var truefalse = message[2];
		
		var filen = message[3];
		
		//전달받은 글이 없거나, 보낸 사람이 내가 연결한 사람이 아니거나 할 경우 아무 내용도 실행하지 않는다.
		if(content == "" || !sender.match($("#recvUser").val())) {
			
		} else if(truefalse) {
			$textArea.html($textArea.html() + "<p class='chat_content other-side'>" + sender + " : <a href='mfdown?ofile=" + filen + "'>" + content + "</p><br>");
			
		} else {
			$textArea.html($textArea.html() + "<p class='chat_content other-side'>" + sender + " : " + content + "</p><br>");
			
		}
		$textArea.scollTop($textArea.height());
	}
	
	function onError(e) {
		alert(e.data);
	}
	
	function onClose(e) {
		alert(e);
	}
	
	function ajaxFile() {
		var form = $("#fileLoad");
		var formData = new FormData($("#fileLoad"));
		
		formData.append("file", $('#fileinput').prop('files')[0]);
		
		$.ajax({
			url: "fileup",
			type: "post",
			datatype: "json",
			data: formData,
			processData: false,
			contentType: false,
			success: function(data, status, xhr) {
				filen = data.fileName;
				console.log(filen);
				$textArea.html($textArea.html() + "<p class='chat_content'>나 : "
					+ "<a href='mfdown?ofile=" + data.fileName + "'>" + $inputMessage.val() + "</a><p><br>");
				
				webSocket.send($("#chatId").val() + "|" + $inputMessage.val() + "|" + tf + "|" + filen);
				$inputMessage.val('');
			},
			error: function(request, status, errorData) {
				console.log("에러");
			}
		});
	}
	
	$("#startBtn").on("click", function() {
		//접속하기 버튼 클릿기
		$("#chatbox").css("display", "block");
		$(this).css("display", "none");
		connection();
	});
	
	//나기기 버튼 클릭시 소켓 닫기
	$("#endBtn").on("click", function() {
		$("chatbox").css("display", "none");
		$("#startBtn").css("display", "inline");
		webSocket.send($("#chatId").val() + " 님이 퇴장하였습니다.");
		webSocket.close();
	});
		
	$("#fileinput").on("change", function() {
		str = $("#fileinput").val().split("\\");
		tf = true;
		
		$inputMessage.val(str[2]);
	});
</script>
</body>
</html>