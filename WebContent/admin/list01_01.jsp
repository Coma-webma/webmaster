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
            <td width="220">아이디(이매일)</td>
            <td width="160">낙네암</td>
            <td width="130">코스(갯수)</td>
            <td width="130">모듈</td>
            <td width="160">회원탈퇴여부</td>
            <td width="160">제제대상</td>
            <td width="160"></td>
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
      conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
      pstmt = conn.prepareStatement(sql.toString());
      rs = pstmt.executeQuery();
      
       while(rs.next()){
            String u_email = rs.getString("u_email");
            String u_nickname = rs.getString("u_nickname");
            int u_cos = rs.getInt("u_cos");
            int u_module = rs.getInt("u_module");
%>   
      <table class=table="1">
      <tr>
         <form name="delform" method="post" action="list_de.jsp">
             <td width="220"><%= u_email %></td>
             <td width="160"><%= u_nickname %></td>
             <td width="130"><%= u_cos %></td>
             <td width="130"><%= u_module %></td>
             <td width="160"></td>
             <td width="160"><progress value="50" max="100"></progress></td>
             <td width="160"><input type="submit" value="회원탈퇴"></td>
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
    </table>
</body>
</html>