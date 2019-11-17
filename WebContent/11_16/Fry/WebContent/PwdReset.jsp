<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<!-- DB에서 유저가 있는 지 확인해야함. -->
<%
	request.setCharacterEncoding("utf-8");
	String u_email = request.getParameter("Find_email");
%>
<!DOCTYPE html>
<html>
<head>
<link href="css/login_head.css" rel="stylesheet" type="text/css">
<link href="css/FindPwd.css" rel="stylesheet" type="text/css">
<link href="css/font.css" rel="stylesheet" type="text/css">
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
				<li id="to_home"><a href="Main.jsp">COMA</a></li>
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
							<a class="a" href="Main_logout.jsp">홈으로</a> | <a class="a"
								href="Login.jsp">로그인</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>

</html>