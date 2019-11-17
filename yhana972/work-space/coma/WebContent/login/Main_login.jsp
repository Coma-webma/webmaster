<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String u_email = "";
	String u_nickname = "";
	if (session.getAttribute("u_email") != null) {
		u_email = (String) session.getAttribute("u_email"); // 실제 로그인한 아이디가 저장되어 있습니다.
	}
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/javatest", "root", "1234");
		if (conn != null) {
			//out.println("DB연결 성공!!");
			sql = "SELECT u_nickname FROM user WHERE u_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_email);
			rs = pstmt.executeQuery();
			if(rs.next()){
				u_nickname = rs.getString("u_nickname");
			}
		}
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		out.println(e);
	}
%>


<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 로그아웃 버튼과 회원이름, 창 6개 -->
<link href="../css/coma.css" rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
	<div class="header">
		<a class="line1" href="../boardAccount.jsp"><%=u_nickname%> <span>님</span></a> <a
			class="line1" href="../logout/Main_logout.jsp">Logout</a>
	</div>
	<table class="main">

		<tr>
			<td height="135"></td>
		</tr>
		<tr>
			<td id="logo" value="coma"></td>
		</tr>
		<tr>
			<td id="search"><input type="text" maxlength="90"
				placeholder="   검색 혹은 입력"></td>
		</tr>
		<tr>
			<td height="40"></td>
		</tr>
		<tr>
			<td id="course">
				<!--하나의창-->
				<div class="card">
					<div>
						<strong id="name"><a href="WebMaster_login.jsp?u_email=<%= u_email%>">course입니다아</a></strong>
					</div>
					<div class="name_card">
						<img class="" src=""> <strong id="name">닉네임닉네임닏네임</strong>
					</div>
				</div> <!--하나의창(추가시 이거가지고가기--> <!--하나의창-->
				<div class="card">
					<div>
						<strong id="name"><a href="">course입니다아</a></strong>
					</div>
					<div class="name_card">
						<img class="" src="../img/main/picture04.jpg"> <strong
							id="name">닉네임닉네임닏네임</strong>
					</div>
				</div> <!--하나의창-->
				<div class="card">
					<div>
						<strong id="name"><a href="">course입니다아</a></strong>
					</div>
					<div class="name_card">
						<img class="" src=""> <strong id="name">닉네임닉네임닏네임</strong>
					</div>
				</div>

			</td>
		</tr>
		<tr>
			<td id="course">
				<!--하나의창-->
				<div class="card">
					<div>
						<strong id="name"><a href="">course입니다아</a></strong>
					</div>
					<div class="name_card">
						<img class="" src=""> <strong id="name">닉네임닉네임닏네임</strong>
					</div>
				</div> <!--하나의창-->
				<div class="card">
					<div>
						<strong id="name"><a href="">course입니다아</a></strong>
					</div>
					<div class="name_card">
						<img class="" src=""> <strong id="name">닉네임닉네임닏네임</strong>
					</div>
				</div> <!--하나의창-->
				<div class="card">
					<div>
						<strong id="name"><a href="">course입니다아</a></strong>
					</div>
					<div class="name_card">
						<img class="" src=""> <strong id="name">닉네임닉네임닏네임</strong>
					</div>
				</div>

			</td>
		</tr>
		<tr>
		<tr>
			<td height="135"></td>
		</tr>
	</table>
</body>
</html>