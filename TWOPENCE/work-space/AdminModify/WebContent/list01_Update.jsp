<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
	request.setCharacterEncoding("UTF-8");
/* 	String u_email = request.getParameter("u_email");   
	String u_nickname = request.getParameter("u_nickname");   */ 
	String u_count = request.getParameter("u_count");
	String index = request.getParameter("index");
   
   Connection conn = null;
   String sql = "";
   PreparedStatement pstmt = null;
   try{
      Class.forName("org.mariadb.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/comaDB", "root", "1234");
      if(conn!=null){
         sql = "update user set u_count = ? where u_idx = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, u_count);
         pstmt.setString(2, index);
         
         System.out.println(pstmt);
         
         pstmt.executeUpdate();
         pstmt.close();
         conn.close();
      }
   }catch(Exception e){
      out.println(e);
   }
%>