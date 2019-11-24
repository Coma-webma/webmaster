<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//request 객체 : client -> server 정보들
	//회원 정보 변수
	String u_email = request.getParameter("u_email");
	String u_nickname = request.getParameter("u_nickname");
	String u_pass = request.getParameter("u_pass");
	String u_Repwd = request.getParameter("u_Repwd");
	String u_info = request.getParameter("u_info");

	try {
		//DB연결
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
		if (conn != null) {
			//out.println("DB연결 성공!!");
			//정보가 바뀌는지 확인
			sql = "SELECT * FROM user WHERE u_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_email);
			rs = pstmt.executeQuery();
			if(rs.next()){
				//비밀번호가 바뀌었는지 확인
				if (u_pass != null) {
					if (u_pass.equals(rs.getString("u_pass"))) {
						//입력한 비밀번호와 디비의 정보가 같다면 
						u_pass = u_Repwd;
					} else {
						response.sendRedirect("boardAccount.jsp?check=false");
					}
				} else {
					u_pass = rs.getString("u_pass");
				}
				//자기소개가 바뀌었는지 확인
				if (u_info == null) {
					u_info = rs.getString("u_info");
				}
			}
			
			//수정
			rs.beforeFirst(); //제일 처음으로 돌림
			sql = "UPDATE user SET u_nickname = ?, u_pass=?, u_info =? where u_email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_nickname);
			pstmt.setString(2, u_pass);
			pstmt.setString(3, u_info);
			pstmt.setString(4, u_email);
			pstmt.executeUpdate();
			
			session.setAttribute("u_email", u_email);
			response.sendRedirect("boardAccount.jsp");	
		}
	} catch (Exception e) {
		out.println(e);
	}
%>