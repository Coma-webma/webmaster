<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   
   if(id.equals("admin") && pwd.equals("1111")){
      session.setAttribute("id",id);
      response.sendRedirect("list01_02.jsp");
   }else{
%>
   <script>
      alert("아이디 또는 패스워드를 확인해 주세요.")
      location.href="login.jsp"
   </script>
<%
   }   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키</title>
</head>
<body>

</body>
</html>