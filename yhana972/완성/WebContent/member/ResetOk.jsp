<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	//request 객체 : client -> server 정보들
	//회원 정보 변수
	String u_pass = request.getParameter("u_pwd");
	String u_email = request.getParameter("u_email");
	System.out.println(u_pass);
	System.out.println(u_email);
	

	try {
		//DB연결
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
		if (conn != null) {
			//out.println("DB연결 성공!!");			
			//비밀번호 수정
			sql = "UPDATE user SET u_pass=? where u_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_pass);
			pstmt.setString(2, u_email);
			pstmt.executeUpdate();
		}
	} catch (Exception e) {
		out.println(e);
	}
%>

<!DOCTYPE html>
<html>
<head>
<link href="../css/login_head.css" rel="stylesheet" type="text/css">
<link href="../css/FindPwd.css" rel="stylesheet" type="text/css">
<link href="../css/font.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
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
			<div class="layerbox layerbox1">
				<form action="" method="POST">
					<div class="login_table">
						<div class="header">
							<strong>요청완료</strong>
						</div>
						<div class="body1">
							<p>
								비밀번호를 변경했습니다.
							</p>
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