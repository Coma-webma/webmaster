<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%    
	request.setCharacterEncoding("UTF-8");	// 	request 클라이언트 -> 서버
	String t_title = request.getParameter("t_title"); // 제목
	String t_content = request.getParameter("t_content"); // 내용
	String t_summary = request.getParameter("t_summary"); // 요약
	String t_public = request.getParameter("t_public"); // 공개,비공개
	String t_cover = request.getParameter("t_cover"); // 완료,준비중	
   	
	Connection conn = null;	// db연결 시작
	String sql = "";
	PreparedStatement  pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
		if(conn != null) {
			sql = "insert into topic(t_title, t_content, t_summary, t_public, t_cover)";
			sql += "values (?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_title);
			pstmt.setString(2, t_content);
			pstmt.setString(3, t_summary);
			pstmt.setString(4, t_public);
			pstmt.setString(5, t_cover);
			pstmt.executeUpdate();	// 업데이트

			response.sendRedirect("boardtopicmain.jsp");
				
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
<title>토픽글쓰기</title>
</head>
<body>
</body>
</html>