<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta charset="utf-8">
	<link href="css/list01.css" rel="stylesheet" type="text/css">
	<link href="css/list02.css" rel="stylesheet" type="text/css">
	<!-- <script type="text/javascript" src="js/Update.js"></script> -->
</head>
<body>
   <table>
    <caption class="caption1">
        <h3>회원목록</h3>
    </caption>
    	<table class="table1">
	        <tr>
	            <td>아이디(이메일)</td>
	            <td>닉네임</td>
	            <td>회원탈퇴여부</td>
	            <td>경고하기</td>
	            <td>제재횟수</td>
	        </tr>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   Statement stmt = null;
   ResultSet rs = null;
   StringBuffer sql = new StringBuffer();
   int index = 0;
   
   String check = request.getParameter("check");

   try{
	   Class.forName("org.mariadb.jdbc.Driver");
	   conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
	   sql.append("select * from user ");
	   pstmt = conn.prepareStatement(sql.toString());
	   rs = pstmt.executeQuery();
      
       while(rs.next()){
            String u_email = rs.getString("u_email");
            String u_nickname = rs.getString("u_nickname");
            String u_leave = rs.getString("u_leave");
            int u_count = rs.getInt("u_count");
            index++;
%> 
	      	<tr>
	      		<form name="Updateform" method="post" action="list01_Update.jsp">
					<td><%= u_email %></td>
					<input name="u_email" type="hidden" value="<%= u_email %>">
					<td><%= u_nickname %></td>
					<td><%= u_leave %></td>
					<td><input type="submit" value="경고하기"></td>
					<td><progress value=<%= u_count %> max="2"></progress></td>
					<input name="u_count" type="hidden"  value="<%= u_count %>">
				</form>
	        </tr>
<%
       	} /* end of while */
%>
		
	</table>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
 		<script>				
			$(":submit").click(function () {
				location.reload();
				/* var warnCon = window.confirm('정말로 경고를 주시겠습니까?');
				if(warnCon){
					var warnBtn = $(this);
					var tr = warnBtn.parent().parent();
					var idx = 0;
					idx = tr.index(); 
					row_idx = $(this).parent().parent().index();
					alert(row_idx);
					
					
					return true;
				}else{
					return false;
				} */
			});
		</script>

		<%if("false".equals(check))%><script>alert("경고 횟수는 최대 2번입니다.");</script>
<%
	
   	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally{
		try {
	    	if(rs != null) rs.close();
	    	if(stmt != null) stmt.close();
	    	if(pstmt != null) pstmt.close();
	    	if(conn != null) conn.close();
	    } catch (SQLException e) {
	    	e.printStackTrace();
	 	}
	}
%>
    </table>
</body>
</html>