<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8"); // 	request 클라이언트 -> 서버
	String c_idx = "";
	String c_title = "";
	String c_content = "";
	String c_summary = "";
	String c_public = "";
	if (request.getParameter("c_idx") != null) {
		c_idx = request.getParameter("c_idx");
		c_title = request.getParameter("c_title");
		c_content = request.getParameter("c_content");
		c_summary = request.getParameter("c_summary");
		c_public = request.getParameter("c_public");
	}
	Connection conn = null; // db연결 시작
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
		if (conn != null) {
			sql = "update course set c_title=?, c_content=?, c_summary=?, c_public=? where c_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c_title);
			pstmt.setString(2, c_content);
			pstmt.setString(3, c_summary);
			pstmt.setString(4, c_public);
			pstmt.setString(5, c_idx);
			pstmt.executeUpdate();
		}
%>
<script>
	alert("수정되었습니다.");
	location.href = "boardcoursemodify.jsp?c_idx=<%=c_idx%>";
</script>
<%
	pstmt.close();
		conn.close();

	} catch (Exception e) {
		out.println(e);
	}
%>