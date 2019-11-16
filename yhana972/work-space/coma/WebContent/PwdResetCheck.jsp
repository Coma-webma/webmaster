<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="coma.SHA256"%>
<!-- 데이터 베이스 해주면 됌 -->
<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	String userEmail = request.getParameter("u_email");
	System.out.println(userEmail);

	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;

	if(rightCode == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공했습니다. ');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();		
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다. 다시 확인해주세요.');");
		script.println("location.href = 'FindPwd.jsp'");
		script.println("</script>");
		script.close();		
		return;
	}
%>