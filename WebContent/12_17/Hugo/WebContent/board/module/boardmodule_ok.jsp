<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%    
	request.setCharacterEncoding("UTF-8");	// 	request 클라이언트 -> 서버
	String m_title = request.getParameter("m_title"); // 제목
	String m_content = request.getParameter("m_content"); // 내용
	String m_summary = request.getParameter("m_summary"); // 요약
	String m_public = request.getParameter("m_public"); // 공개,비공개
	String m_notice = request.getParameter("m_notice"); // 댓글공지
	String m_together_title = request.getParameter("m_together_title"); // 공동공부 정할 이름
	String m_view_title = request.getParameter("m_view_title"); // 봤어요 타이틀
   	
	Connection conn = null;	// db연결 시작
	String sql = "";
	PreparedStatement  pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
		if(conn != null) {
			sql = "insert into module(m_title,m_content,m_summary,m_public,m_notice,m_together_title,m_view_title)";
			sql += "values (?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_title);
			pstmt.setString(2, m_content);
			pstmt.setString(3, m_summary);
			pstmt.setString(4, m_public);
			pstmt.setString(5, m_notice);
			pstmt.setString(6, m_together_title);
			pstmt.setString(7, m_view_title);
			pstmt.executeUpdate();	// 업데이트

			response.sendRedirect("boardmodulemain.jsp");
				
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
<title>모듈게시글작성</title>
</head>
<body>
</body>
</html>