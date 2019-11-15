<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8">
        <link href="css/list01.css" rel="stylesheet" type="text/css">
        <link href="css/list02.css" rel="stylesheet" type="text/css">
    </head>
<body>
    <table>
        <caption class="caption1">
            <h3>신고하기 게시판</h3>
        </caption>
        <table class="table2">
        <tr>
            <td width="220">아이디(이매일)</td>
            <td width="130">낙네암</td>
            <td width="480">제목(갯수)</td>
            <td width="160">날짜</td>
            <td width="130">확인여부</td>
        </tr>
    </table>
</table>
<%
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   StringBuffer sql = new StringBuffer();
   sql.append("select * from list ");

   try{
      Class.forName("org.mariadb.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
      pstmt = conn.prepareStatement(sql.toString());
      rs = pstmt.executeQuery();
      
       while(rs.next()){
            String u_email = rs.getString("u_email");
            String u_nickname = rs.getString("u_nickname");
            String u_title = rs.getString("u_title");
            String u_date = rs.getString("u_date");
            String u_confirm = rs.getString("u_confirm");
%>   
      <table class=table="1">
      <tr>
         <form name="delform" method="post" action="list_de.jsp">
             <td width="220"><%= u_email %></td>
             <td width="130"><%= u_nickname %></td>
             <td width="480"><%= u_title %></td>
             <td width="160"><%= u_date %></td>
             <td width="130"><%= u_confirm %></td>
        </tr>
        
        </form>
        </table>
  
<%
       }
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
</body>
</html>