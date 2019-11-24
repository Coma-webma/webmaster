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
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	String u_email = request.getParameter("u_email");

	boolean rightCode = (new SHA256().getSHA256(u_email).equals(code)) ? true : false;

	if (rightCode == true) {
%>
<!DOCTYPE html>
<html>
<head>
<link href="../css/login_head.css" rel="stylesheet" type="text/css">
<link href="../css/FindPwd.css" rel="stylesheet" type="text/css">
<link href="../css/font.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/Reset.js"></script>
<script type="text/javascript" src="../jquery/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="head">
		<header>
			<hgroup>
				<p>
					<a class="title" href>비밀번호 재설정</a>
				</p>
			</hgroup>
			<ul id="left_nav">
				<li id="to_home"><a href="../index.jsp">COMA</a></li>
			</ul>
		</header>
	</div>
	<div id="cols">
		<div class="entry-area">
			<div class="layerbox">
				<form name="ResetForm" action="ResetOk.jsp?u_email=<%=u_email%>" method="POST"
					onsubmit="return CheckPwd();">
					<div class="login_table">
						<div class="header">
							<strong>비밀번호 재설정</strong>
						</div>
						<div class="check" id="check"
							style="display: none; text-align: center; font-size: 13px; margin: 10px; color: red">
							<p id="check_pwd" style="display: none; margin-bottom: 5px;"></p>
						</div>
						<div
							style="text-align: center; font-size: 13px; padding-top: 30px;">
							<p>비밀번호를 새로 설정한 후에 로그인 페이지로 이동합니다.</p>
						</div>
						<div class="body">
							<dl>
								<dt>
									<label for="pwd">비밀번호</label>
								</dt>
								<dd>
									<input type="password" class="text" id="pwd" name="u_pwd">
								</dd>
								<dt>
									<label for="Repwd">비밀번호 확인</label>
								</dt>
								<dd>
									<input type="password" class="text" id="Repwd" name="Repwd">
								</dd>
							</dl>
							<div class="btn">
								<p>
									<button type="submit" class="btn btn_submit">설정</button>
								</p>
							</div>
						</div>
						<div class="footer">
							<a class="a" href="../index.jsp">홈으로</a> | <a class="a"
								href="Login.jsp">로그인</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
<%
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