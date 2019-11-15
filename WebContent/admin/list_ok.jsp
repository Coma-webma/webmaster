<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
   // request 객체 : client -> server 정보들
   request.setCharacterEncoding("UTF-8");
   String u_email    = request.getParameter("u_email");
   String u_nickname = request.getParameter("u_nickname");
   String u_cos      = request.getParameter("u_cos");
   String u_module   = request.getParameter("u_module");
   
   Connection conn = null;
   String sql = "";
   PreparedStatement pstmt = null;
   try{
      Class.forName("org.mariadb.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
      if(conn!=null){
         //out.println("DB연결 성공!!");
         sql = "INSERT INTO user (u_email, u_nickname, u_cos, u_module)"; 
         sql += "VALUES (?, ?, ?, ?)";
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, u_email);
         pstmt.setString(2, u_nickname);
         pstmt.setString(3, u_cos);
         pstmt.setString(4, u_module);
      
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
<title>회원가입 완료</title>
</head>
<body>
   <h2>정보 출력</h2>
   <p>아이디(이메일) : <%=u_email%></p>
   <p>닉네임 : <%=u_nickname%></p>
   <p>코스 : <%=u_cos%></p>
   <p>모듈 : <%=u_module%></p>
</body>
</html>