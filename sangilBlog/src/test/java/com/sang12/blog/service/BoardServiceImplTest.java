package com.sang12.blog.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

public class BoardServiceImplTest {
	
	@Test
	public void sendMailTest() {
		Properties props = System.getProperties();
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "25");
		props.put("defaultEncoding", "utf-8");
		props.put("mail.smtp.auth", "true");

		final String userId = "wo566";
		final String userPw = "#$#@chleogus6";

		try {
			String sender = "wo566@naver.com"; 
			String subject = "메일 테스트"; //메일 제목
			String body = "2222222222222"; //메일 본문

			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(userId, userPw);
				}
			});
			
			session.setDebug(false); //Debug 모드 설정.
			Message mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress(sender)); 
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress("sang12@kakao.com") ); //수신자 셋팅
			mimeMessage.setSubject(subject); //제목 세팅
			mimeMessage.setText(body); //본문 세팅
			Transport.send(mimeMessage);
		} catch (Exception e) {
			System.out.println("메일보내기 오류 : "+ e.getMessage());
		}
	}
}
