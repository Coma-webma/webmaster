<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="../include/Session.jsp" %>
<%
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int total = 0;
	try{
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jsptest", "root", "1234");
		if(conn!=null){
			sql = "SELECT count(b_idx) FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				total = rs.getInt(1);	// 2
			}			
		}
	}catch(Exception e){
		out.println(e);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
</head>
<body>
<h2>리스트</h2>
<h3>총 게시물 : <%=total%></h3>
<table width="800" border="1">
	<tr>
		<th>글번호</th>
		<th width="300">제목</th>
		<th>아이디</th>
		<th>조회수</th>
		<th>날짜</th>
	</tr>
<%
	if(total == 0){
%>
	<tr>
		<td colspan="5">등록된 글이 없습니다.</td>
	</tr>
<%
	}else{	
		sql  = "SELECT * FROM board order by b_idx desc";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int i = 0;
		while(rs.next()){
			String b_name = rs.getString("b_name");
			String b_title = rs.getString("b_title");
			String b_hit = rs.getString("b_hit");
			String b_registdate = rs.getString("b_registdate");
	%>
	<tr>
		<td><%=(total-i)%></td>
		<td><%=b_title%></td>
		<td><%=b_name%></td>
		<td><%=b_hit%></td>
		<td><%=b_registdate.substring(0,10)%></td>	
	</tr>
<%
			i++;
		}
	}
%>
</table>
</body>
</html>