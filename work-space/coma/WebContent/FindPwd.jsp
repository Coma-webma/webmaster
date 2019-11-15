<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<link href="css/FindPwd.css" rel="stylesheet" type="text/css">
<link href="css/font.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/FindPwd.js"></script>
<script type="text/javascript" src="jquery/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<div class="head">
		<header>
			<hgroup>
				<p>
					<a class="title" href>비밀번호 찾기</a>
				</p>
			</hgroup>
			<ul id="left_nav">
				<li id="to_home"><a href="Main.jsp">COMA</a></li>
			</ul>
		</header>
	</div>
	<div id="cols">
		<div class="entry-area">
			<div class="layerbox">
				<form name="FindPwdForm" action="PwdReset.jsp" method="POST"
					onsubmit="return checkEmail()">
					<div class="login_table">
						<div class="header">
							<strong>비밀번호 찾기</strong>
						</div>
						<div class="check" id="check" style="display: none; text-align: center; font-size: 13px; margin: 10px; color: red; border-bottom: solid 1px #ddd;">
							<p id="check_email" style="display: none; margin-bottom: 5px;"></p>
						</div>
						<div class="body">
							<div class="label">
								<label for="Find_email">이메일 주소를 입력해주세요.</label>
							</div>
							<input type="text" class="text" id="email" name="Find_email"
								value="이메일 주소">
							<div class="btn">
								<p>
									<button type="submit" class="btn btn_submit">비밀번호 찾기</button>
								</p>
							</div>
						</div>
						<div class="footer">
							<a class="a" href="Login.jsp">로그인</a> | <a class="a"
								href="Join.jsp">회원가입</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>