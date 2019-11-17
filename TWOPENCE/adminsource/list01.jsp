<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>

<script src="js/list.js"></script>
</head>
<body>
   <form name="regForm" method="post" action="list_ok.jsp">
      <p><label>아이디(이메일) : <input type="text" name="u_email"></label>
      
      <p><label>닉네임 : <input type="text" name="u_nickname"></label></p>
      
      <p><label>코스 : <input type="text" name="u_cos"></label></p>
      
      <p><label>모듈 : <input type="text" name="u_module"></label></p>
      
      <p><input type="button" value="가입완료" onclick="sendit()"></p>
   </form>
</body>
</html>