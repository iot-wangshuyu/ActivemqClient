package com.shuyu.activemq.service.impl;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.springframework.stereotype.Component;

import com.shuyu.activemq.controller.websocket.WebsocketController;

/**
 * 
 * @author liang
 * @description  Topic消息监听器
 * 
 */
@Component
public class TopicReceiver2 implements MessageListener{


	@Override
	public void onMessage(Message message) {
		try {
			TextMessage textMessage = (TextMessage) message;
			String vString=textMessage.getText();
			System.out.println("TopicReceiver2接收到消息:"+vString);
			WebsocketController.broadcast("user", vString);
		} catch (JMSException e) {
			e.printStackTrace();
		}
	}
	
}
