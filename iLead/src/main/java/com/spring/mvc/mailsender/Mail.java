package com.spring.mvc.mailsender;

import java.util.Date;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class Mail {

	private MailSender mailSender;
	private SimpleMailMessage simpleMailMessage;
	
	public void setSimpleMailMessage(SimpleMailMessage simpleMailMessage) {
		this.simpleMailMessage = simpleMailMessage;
	}

	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public void sendMail(String subject, String content, String to_property) {

		simpleMailMessage.setTo(to_property);
		simpleMailMessage.setText(String.format(content));
		simpleMailMessage.setSubject(subject);
		simpleMailMessage.setFrom("iLead");
		simpleMailMessage.setSentDate(new Date());
		simpleMailMessage.setReplyTo(to_property);
		System.out.println(simpleMailMessage.toString());
		
		mailSender.send(simpleMailMessage);
		
	}
	
	
}
