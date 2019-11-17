<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="coma.SHA256"%>
<%@page import="java.io.PrintWriter"%>
<!-- 데이터 베이스 해주면 됌 -->
<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	String userEmail = request.getParameter("u_email");

	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;

	if (rightCode == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 성공했습니다.');");
		script.println("</script>");
		script.close();
		session.setAttribute("u_email", userEmail);
		response.sendRedirect("Main_login.jsp");
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다.');");
		script.println("location.href = 'FindPwd.jsp'");
		script.println("</script>");
		return;
	}
%>