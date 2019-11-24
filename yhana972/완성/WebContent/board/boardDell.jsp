<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%    
	request.setCharacterEncoding("UTF-8");	// 	request 클라이언트 -> 서버
	String idx = request.getParameter("idx");
	String idx_dell = request.getParameter("idx_dell");
	String idx_name = ""; // 넘어오는 값
	String jsp = ""; // 이동
	
	Connection conn = null;	// db연결 시작
	String sql = "";
	PreparedStatement  pstmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
		if(conn != null) {
			switch(idx_dell){ // 여러 게시판의 삭제
			case "course": idx_name = "c_idx"; jsp="course/boardcoursemain.jsp"; break;
			case "module": idx_name = "m_idx"; jsp="module/boardmodulemain.jsp"; break;
			case "topic": idx_name = "t_idx"; jsp="topic/boardtopicmain.jsp"; break;
			}
			sql = "delete from "+idx_dell+" where "+idx_name+" =? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idx);
			pstmt.executeUpdate();	// 업데이트

			response.sendRedirect(jsp);
				
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