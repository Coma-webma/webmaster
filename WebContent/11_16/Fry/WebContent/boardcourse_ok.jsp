<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.PreparedStatement"%>    
<%    
	request.setCharacterEncoding("UTF-8");	// 	request 클라이언트 -> 서버
	String c_title = request.getParameter("c_title");
	String c_content = request.getParameter("c_content");
	String c_summary = request.getParameter("c_summary");
	
	Connection conn = null;	// db연결 시작
	String sql = "";
	PreparedStatement  pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
		if(conn != null) {
			sql = "insert into course(c_title,c_content,c_summary)";
			sql += "values (?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c_title);
			pstmt.setString(2, c_content);
			pstmt.setString(3, c_summary);
			pstmt.executeUpdate();	// 업데이트

			response.sendRedirect("boardcoursemain.jsp");
				
			pstmt.close();
			conn.close();
		}
	} catch(Exception e) {
		out.println(e);
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>