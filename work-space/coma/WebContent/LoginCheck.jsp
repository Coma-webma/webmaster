<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String u_email = request.getParameter("u_email");
	String u_pass = request.getParameter("u_pwd");
	
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/javatest", "root", "1234");
		if(conn!=null){
			//out.println("DB연결 성공!!");
			sql = "SELECT u_email, u_nickname FROM user WHERE u_email = ? AND u_pass = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_email);
			pstmt.setString(2, u_pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				session.setAttribute("u_email", u_email);
				session.setAttribute("u_nickname", rs.getString("u_nickname"));
				response.sendRedirect("Main.jsp");
			}else{
				response.sendRedirect("Login.jsp?check=false");
			}
			pstmt.close();
			conn.close();
		}
	}catch(Exception e){
		out.println(e);
	}

%>