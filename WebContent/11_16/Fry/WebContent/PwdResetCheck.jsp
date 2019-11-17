<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="coma.SHA256"%>
<%@page import="coma.Gmail"%>
<%@ page import="java.io.PrintWriter"%>
<%
	//사용자에게 보낼 메시지를 기입합니다.

	String host = "http://localhost:8001/coma/";
	String from = "service.coma12@gmail.com";
	String to = u_email;
	String subject = "비밀번호 인증을 위한 확인 메일입니다.";
	String content = "다음 링크에 접속하여 비밀번호 인증 후 계정 설정 페이지에서 비밀번호를 바꿔주세요." + "<a href='" + host + "PwdResetCheck.jsp?code="
			+ new SHA256().getSHA256(to) + "&u_email=" + u_email + "'>비밀번호 인증</a>";

	// SMTP에 접속하기 위한 정보를 기입합니다.
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");

	try {
		Authenticator auth = new Gmail();
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses);
		msg.setSubject(subject);
		Address fromAddr = new InternetAddress(from);
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to);
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF-8");
		Transport.send(msg);
	} catch (Exception e) {
		e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다..');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>
<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	String userEmail = request.getParameter("u_email");

	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;

	if (rightCode == true) {
		session.setAttribute("u_email", userEmail);
		response.sendRedirect("Main_login.jsp");
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다.');");
		script.println("location.href = 'FindPwd.jsp'");
		script.println("</script>");
		return;
	}
%>