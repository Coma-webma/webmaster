<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% 
   request.setCharacterEncoding("UTF-8");
   String u_email = request.getParameter("u_email");   
   String u_nickname = request.getParameter("u_nickname");   

   Connection conn = null;
   String sql = "";
   PreparedStatement pstmt = null;
   try{
      Class.forName("org.mariadb.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/comaDB", "root", "1234");
      if(conn!=null){
         sql = "delete from user where u_nickname=?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, u_nickname);
      
         pstmt.executeUpdate();
         pstmt.close();
         conn.close();
      }
   }catch(Exception e){
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
   <p>탈퇴처리되었습니다</p>   
</body>
</html>