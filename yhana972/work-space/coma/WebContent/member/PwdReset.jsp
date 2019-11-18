<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
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
<!-- DB에서 유저가 있는 지 확인해야함. -->
<%
	request.setCharacterEncoding("utf-8");
	String u_email = request.getParameter("Find_email");
%>
<%
	//사용자에게 보낼 메시지를 기입합니다.

	String host = "http://localhost:8001/coma/member/";
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
<!DOCTYPE html>
<html>
<head>
<link href="../css/login_head.css" rel="stylesheet" type="text/css">
<link href="../css/FindPwd.css" rel="stylesheet" type="text/css">
<link href="../css/font.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>비밀번호 리셋</title>
</head>

<body>
	<div class="head">
		<header>
			<hgroup>
				<p>
					<a class="title" href>비밀번호 리셋완료</a>
				</p>
			</hgroup>
			<ul id="left_nav">
				<li id="to_home"><a href="../logout/index.jsp">COMA</a></li>
			</ul>
		</header>
	</div>
	<div id="cols">
		<div class="entry-area">
			<div class="layerbox layerbox1">
				<form action="" method="POST">
					<div class="login_table">
						<div class="header">
							<strong>요청완료</strong>
						</div>
						<div class="body1">
							<p>
								비밀번호를 새로 설정할 수 있는 URL을 이메일 주소<br>
							</p>
							<p>
								<%=u_email%>로 전송했습니다.<br>
							</p>
							<p>
								스팸함으로 메일을 전송했으니 스팸함을 꼭 확인해주세요.<br>
							</p>
							<p>혹시, 못 받으셨다면 받은 편지함을 확인해보세요. :)</p>
						</div>
						<div class="footer">
							<a class="a" href="../logout/index.jsp">홈으로</a> | <a class="a"
								href="Login.jsp">로그인</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>