<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="coma.SHA256"%>
<%@page import="coma.Gmail"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code");
	String userEmail = request.getParameter("u_email");

	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;

	if (rightCode == true) {
		session.setAttribute("u_email", userEmail);
		response.sendRedirect("../login/Main_login.jsp");
		return;
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다.');");
		script.println("location.href = '../member/FindPwd.jsp'");
		script.println("</script>");
		return;
	}
%>