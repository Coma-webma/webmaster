<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	// 회원가입과 동일하게 데이터를 전달받음
	request.setCharacterEncoding("UTF-8");
	// m_userid는 세션에 있는 아이디를 사용
	String u_idx = request.getParameter("u_idx");
	String u_email = request.getParameter("u_email");
	String u_nickname = request.getParameter("u_nickname");
	String u_pass = request.getParameter("u_pass");
	String u_pass_new = request.getParameter("u_pass_new");
	String u_pass_new_re = request.getParameter("u_pass_new_re");
	String u_email_chk = request.getParameter("u_email_chk");
	String u_img = request.getParameter("u_img");
	String u_info = request.getParameter("u_info");
	String u_leave = request.getParameter("u_leave");
	String u_count = request.getParameter("u_count");

	// 세션이 없다면 Login.jsp로 이동
	String userid = "";
	if (session.getAttribute("u_email") != null) {
		u_email = (String) session.getAttribute("u_email");
	} else {
		response.sendRedirect("Login.jsp"); // 로그인이 되어있지 않다면 Login.jsp로 이동
	}

	// DB연결
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/javatest", "root", "1234");
		if (conn != null) {
			//out.println("DB연결 성공!!");
			sql = "SELECT * FROM user WHERE u_email = ? and u_nickname =?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_email);
			pstmt.setString(2, u_nickname);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				sql = "UPDATE user SET u_email=?, u_nickname=?";
				sql += "u_pass=?, u_pass_new=?, u_pass_new_re=?, u_info=?, u_img=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, u_email);
				pstmt.setString(2, u_nickname);
				pstmt.setString(3, u_pass);
				pstmt.setString(4, u_pass_new);
				pstmt.setString(5, u_pass_new_re);
				pstmt.setString(6, u_info);
				pstmt.setString(7, u_img);
				pstmt.executeUpdate();
%>
<script>
	alert("수정되었습니다.")
	location.href = "Login.jsp"
</script>
<%
	} else {
%>
<script>
	alert("패스워드를 확인해 주세요.")
	location.href = "Login.jsp"
</script>
<%
	}
		}
	} catch (Exception e) {
		out.println(e);
	}
%>