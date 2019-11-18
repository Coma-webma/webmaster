<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8"); // 	request 클라이언트 -> 서버
	String m_idx = "";
	String m_title = "";
	String m_content = "";
	String m_summary = "";
	String m_public = "";
	String m_notice = "";
	String m_together_title = "";
	String m_view_title = "";
	
	if (request.getParameter("m_idx") != null) {
		m_idx = request.getParameter("m_idx");
		m_title = request.getParameter("m_title");
		m_content = request.getParameter("m_content");
		m_summary = request.getParameter("m_summary");
		m_public = request.getParameter("m_public");
		m_notice = request.getParameter("m_notice");
		m_together_title = request.getParameter("m_together_title");
		m_view_title = request.getParameter("m_view_title");
	}
	Connection conn = null; // db연결 시작
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/javatest", "root", "1234");
		if (conn != null) {
			sql = "update module set m_title=?, m_content=?, m_summary=?, m_public=?, m_notice=?, m_together_title=?, m_view_title=? where m_idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_title);
			pstmt.setString(2, m_content);
			pstmt.setString(3, m_summary);
			pstmt.setString(4, m_public);
			pstmt.setString(5, m_notice);
			pstmt.setString(6, m_together_title);
			pstmt.setString(7, m_view_title);
			pstmt.setString(8, m_idx);
			pstmt.executeUpdate();
		}
%>
<script>
	alert("수정되었습니다.");
	location.href = "boardmodulemodify.jsp?m_idx=<%=m_idx%>";
</script>
<%
	pstmt.close();
		conn.close();

	} catch (Exception e) {
		out.println(e);
	}
%>