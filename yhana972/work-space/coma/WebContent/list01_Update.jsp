<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String u_count = request.getParameter("u_count");
	String u_email = request.getParameter("u_email");
   	int count = 0;
   	count = Integer.parseInt(u_count);
	
   	if(count == 2){
   		response.sendRedirect("list01_01.jsp?check=false");
   	}else{
		Connection conn = null;
		String sql = "";
		PreparedStatement pstmt = null;
		
		try{
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/javatest", "root", "1234");
			if(conn!=null){
				sql = "update user set u_count = ? where u_email = ?";
				pstmt = conn.prepareStatement(sql);
				
				//경고 횟수 추가
				count += 1;
				u_count = Integer.toString(count);
				
				pstmt.setString(1, u_count);
				pstmt.setString(2, u_email);
					       
				System.out.println(pstmt);
				
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
				
				response.sendRedirect("list01_01.jsp");
		    }
		}catch(Exception e){
		    out.println(e);
		}
   	}
%>

