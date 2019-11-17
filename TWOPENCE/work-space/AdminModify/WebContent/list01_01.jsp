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
</head>
<body>
   <table>
    <caption class="caption1">
        <h3>회원목록</h3>
    </caption>
       <table class="table2">
        <tr>
            <td width="220">아이디(이메일)</td>
            <td width="160">닉네임</td>
            <td width="160">회원탈퇴여부</td>
            <td width="160">경고하기</td>
            <td width="160">제재횟수</td>
        </tr>
     	</table>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   StringBuffer sql = new StringBuffer();
   sql.append("select * from user ");

   try{
	   Class.forName("org.mariadb.jdbc.Driver");
	   conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/comaDB", "root", "1234");
	   pstmt = conn.prepareStatement(sql.toString());
	   rs = pstmt.executeQuery();
      
       while(rs.next()){
            String u_email = rs.getString("u_email");
            String u_nickname = rs.getString("u_nickname");
            String u_leave = rs.getString("u_leave");
            int u_count = rs.getInt("u_count");
%> 
      <table class="table1">
      	<tr>
			<td width="220"><%= u_email %></td>
			<td width="160"><%= u_nickname %></td>
			<td width="160"><%= u_leave %></td>
			<td width="160"><input id="warnbutton" type="button" value="경고하기"></td>
			<td width="160"><progress value=<%= u_count %> max="2"></progress></td>
        </tr>
        
      </table>
<%
       	} /* end of while */
       
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally{
		try {
	    	if(rs != null) rs.close();
	    	if(pstmt != null) pstmt.close();
	    	if(conn != null) conn.close();
	    } catch (SQLException e) {
	    	e.printStackTrace();
	 	}
	}
%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
			<script>				
				$(function () {
					$(":button").click(function () {
						var warnCon = window.confirm('정말로 경고를 주시겠습니까?');
						if(warnCon){
/* 							var warnBtn = $(this);
							var tr = warnBtn.parent().parent();
							var td = tr.children();
							var count = td.eq(4).text();
							count *= 1;
							alert(count); */
							
 							if(u_count == 2){
								alert('경고 최대 횟수를 초과하였습니다.');
							}else{
								count += 1;
								<%
								/* DB의 경고 횟수(u_count) 올리기 */
								sql.append("update member set count = '변경값' where nickname='닉네임' ");
								
								
						%>
							}
							
						}else{
							return false;
						}
					});
				});
				
			</script>

    </table>
</body>
</html>