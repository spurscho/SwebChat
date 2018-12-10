package com.swebchat.chat.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/unicast")
public class UniCast {
	//연결한 사용자 리스트 저장용 필드
	// 단 사용자가 2번 연결하면 안되기 때분에 Set를 통해 중보 배제
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void onOpen(Session session) {
		//연결 요천한 사용자를 Set에 추가
		clients.add(session);
	}
	
	@OnMessage
	public void onMessage(String msg, Session session) throws IOException {
		//메세지를 받아서 다른 사용자에게 전송하는 동안 사용자 변경이 발생하지 않도록 동기화 처리
		synchronized(clients) {
			//현재 연결된 사용자에게 받은 메세지를 보낸다.
			for(Session client : clients) {
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(msg);
				}
			}
		}
	}
	
	@OnError
	public void onError(Throwable error) {
		error.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}
}
