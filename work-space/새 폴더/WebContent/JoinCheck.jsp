<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.PreparedStatement"%>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	//request 객체 : client -> server 정보들
	String u_nickname 	= request.getParameter("u_nickname");
	String u_email 		= request.getParameter("u_email");
	String u_pass 		= request.getParameter("u_pwd");

	try{
		//DB연결
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/javatest", "root", "1234");
		if(conn!=null){
			//out.println("DB연결 성공!!");
			sql = "INSERT INTO user (u_email, u_nickname, u_pass) VALUES(?, ?, ?)"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_email);
			pstmt.setString(2, u_nickname);
			pstmt.setString(3, u_pass);
			pstmt.executeUpdate();
		}
	}catch(Exception e){
		out.println(e);
	}	
%>

<!DOCTYPE html>
<html>
<head>
<link href="css/FindPwd.css" rel="stylesheet" type="text/css">
<link href="css/font.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>COMA</title>
</head>
<body>
    <div class="head">
        <header>
            <hgroup>
                 <p>
                    <a class="title" href>COMA</a>
                </p>
            </hgroup>
            <ul id="left_nav">
                <li id="to_home">
                    <a href="COMA.html">COMA</a>
                </li>
            </ul>
        </header>
    </div>
    <div id="cols">
        <div class="entry-area">
            <div class="layerbox">
                <form action="" method="POST">
                    <div class="login_table">
                        <div class="header">
                            <strong>요청완료</strong>
                        </div>
                        <div class="body1">
                                <p>회원 가입 완료!<br></p>
                        </div>
                        <div class="footer">
                            <a class="a" href="Main.jsp">홈으로</a>
                            |
                            <a class="a" href="Login.jsp">로그인</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>