<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8"); // 	request 클라이언트 -> 서버
	String t_idx = "";
	String t_title = "";
	String t_content = "";
	String t_summary = "";
	String t_public = "";
	String t_cover = "";
	if (request.getParameter("t_idx") != null) {
		t_idx = request.getParameter("t_idx");
		t_title = request.getParameter("t_title");
		t_content = request.getParameter("t_content");
		t_summary = request.getParameter("t_summary");
		t_public = request.getParameter("t_public");
		t_cover = request.getParameter("t_cover");
	}
	Connection conn = null; // db연결 시작
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/javatest", "root", "1234");
		if (conn != null) {
			sql = "update topic set t_title=?, t_content=?, t_summary=?, t_public=?,t_cover=? where t_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t_title);
			pstmt.setString(2, t_content);
			pstmt.setString(3, t_summary);
			pstmt.setString(4, t_public);
			pstmt.setString(5, t_cover);
			pstmt.setString(6, t_idx);
			pstmt.executeUpdate();
		}
%>
<script>
	alert("수정되었습니다.");
	location.href = "boardtopicmodify.jsp?t_idx=<%=t_idx%>";
</script>
<%
	pstmt.close();
		conn.close();

	} catch (Exception e) {
		out.println(e);
	}
%>