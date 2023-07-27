package com.o.e.member;

import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Component;

@Component
public class MailSendService {

	private static int authNumber; 
	
		public static void makeRandomNumber() {
			// 난수의 범위 111111 ~ 999999 (6자리 난수)
			Random r = new Random();
			int checkNum = r.nextInt(888888) + 111111;
			System.out.println("인증번호 : " + checkNum);
			authNumber = checkNum;
		}
		
		public static String mailSend(String email) throws Exception{
			makeRandomNumber();
			//Mail Server 설정
			String charSet="utf-8";
			String hostSMTP="smtp.gmail.com";
			String hostSMTPid="ansangouk216@gmail.com"; //관리자 이메일 아이디
			String hostSMTPpw="siregmtomhtytejw"; //관리자 이메일 비밀번호
			
			//보내는 사람 
			String fromEmail="sangouk216@naver.com"; //보내는 사람 이메일 
			String fromName="오늘 이런 수업 어때요?"; //보내는 사람 이름
			
			String subject="회원 가입 인증 이메일 입니다."; //메일 제목
			String msg="";
			
			msg +="홈페이지를 방문해주셔서 감사합니다.";
			msg +="<br><br>";
			msg +="인증 번호는 " + authNumber + "입니다.";
			msg +="<br><br>";
			msg +="해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			
			//email전송
			String mailRecipient=email;//받는 사람 이메일 주소
			try {
				//객체 선언
				HtmlEmail mail = new HtmlEmail();
				mail.setDebug(true);
				mail.setCharset(charSet);
				mail.setSSLOnConnect(true);
				mail.setHostName(hostSMTP);
				mail.setSmtpPort(587); 
				mail.setAuthentication(hostSMTPid, hostSMTPpw);
				mail.setStartTLSEnabled(true);
				mail.addTo(mailRecipient,charSet);
				mail.setFrom(fromEmail, fromName, charSet);
				mail.setSubject(subject);
				mail.setHtmlMsg(msg);
				mail.send();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return Integer.toString(authNumber);
		}
		
		//임시 비밀번호 메일 발송
		public static void sendEmail(Member m) throws Exception{
			
			//Mail Server 설정
			String charSet="utf-8";
			String hostSMTP="smtp.gmail.com";
			String hostSMTPid="ansangouk216@gmail.com"; //관리자 이메일 아이디
			String hostSMTPpw="siregmtomhtytejw"; //관리자 이메일 비밀번호
			
			//보내는 사람 
			String fromEmail="sangouk216@naver.com"; //보내는 사람 이메일 
			String fromName="오늘 이런 수업 어때요?"; //보내는 사람 이름
			
			String subject="임시 비밀번호 알려드립니다."; //메일 제목
			String msg="";
			
			msg +="<div align='lift'";
			msg +="<h3>";
			msg +=m.getM_id() + "님의 임시 비밀번호입니다. <br>로그인 후 비밀번호를 변경해 주세요</h3>";
			msg +="<p>임시 비밀번호 : ";
			msg +=m.getM_pw() + "</p></div>";
			
			//email전송
			String mailRecipient=m.getM_email();//받는 사람 이메일 주소
			try {
				//객체 선언
				HtmlEmail mail = new HtmlEmail();
				mail.setDebug(true);
				mail.setCharset(charSet);
				mail.setSSLOnConnect(true);
				mail.setHostName(hostSMTP);
				mail.setSmtpPort(587); 
				mail.setAuthentication(hostSMTPid, hostSMTPpw);
				mail.setStartTLSEnabled(true);
				mail.addTo(mailRecipient,charSet);
				mail.setFrom(fromEmail, fromName, charSet);
				mail.setSubject(subject);
				mail.setHtmlMsg(msg);
				mail.send();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
//		public void findPw(HttpServletResponse response,Member vo) {
//			response.setContentType("text/html;charset=utf-8");
//			
//		}

}
