<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="css/boardmain.css" rel="stylesheet" type="text/css">
<link href="css/boardtopicmain.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="resize/plugin.js"></script>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8"); // 	request 클라이언트 -> 서버
	String m_idx = "";
	String m_title = "";
	if (request.getParameter("m_idx") != null) {
		m_idx = request.getParameter("m_idx");
	}

	Connection conn = null; // db연결 시작
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
		if (conn != null) {
			sql = "select *from module";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>모듈>토픽추가</title>
</head>

<body>
	<header>
		<div>
			<nav class="admin_left_nav">
				<ul class="topmenu">
					<li><a class=line1 href="COMA.jsp">COMA</a></li>
					<li><a class=line2 href=#>전체메뉴</a></li>
				</ul>
			</nav>
			<nav class="admin_right_nav">
				<ul class="topmenu">
					<li><a class=line1 href=#>내컨텐츠</a></li>
					<li><a class=line1 href=#>참여활동</a></li>
					<li><a class=line2 href=#>닉네임</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div id=contant>
		<div>
			<nav id=main>
				<ul class=admin_menu>
					<li><a class="active" href="boardmodulemain.jsp"><span
							class="menu_name ">모듈</span></a></li>
					<li><a href="boardcoursemain.jsp"><span class="menu_name">코스</span></a></li>
					<li><a href="boardAccount.jsp"><span class="menu_name">계정</span></a></li>
				</ul>
			</nav>
			<nav>
				<ul class="menu_all">
					<li class="menu_all_add">
						<p>전체 모듈 목록</p>
					</li>
					<div class="button1">
						<a href="boardmodule.jsp" style="color: white">추가</a>
					</div>
					<select class="sel" name="latest">
						<option value="low">최신순</option>
						<option value="low">내림차순</option>
						<option value="up">오름차순</option>
					</select>
				</ul>
				<nav id="main_bar">
					<ul class="main_bar_all">
						<%
							while (rs.next()) {
										m_title = rs.getString("m_title");
						%>
						<a href="boardmodulemodify.jsp?m_idx=<%=rs.getString("m_idx")%>">
							<li>▶ <%=m_title%></li>
						</a>
						<%
							}
								}
							} catch (Exception e) {
								out.println(e);
							}
						%>
					</ul>
				</nav>
		</div>
		<!-- 관리자모드 메인 -->
		<article>
			<fieldset id="functions">
				<ul>
					<li><input type="radio" id="function_basic" name="function"
						value> <label for="function_basic"><a
							href="boardmodulemodify.jsp" style="color: black">커버</a></label></li>
					<li><label for="function_topic"><a
							href="boardtopicmain.jsp" style="color: black">토픽목록</a></label></li>
				</ul>
			</fieldset>
			<hgroup id="img1">
				<h2>모듈이름 > 토픽목록</h2>
				<!-- 모듈이름 추가-->
			</hgroup>
			<section>
				<div class="select">
					선택된 항목을 <select>
						<option value="top">선택한 항목에 대한 작업</option>
						<option value="low">공개</option>
						<option value="up">비공개</option>
					</select>
					<div class="make">
						<a href="boardtopic.jsp" style="color: white">토픽만들기</a>
					</div>
				</div>
				<table class="a12">
					<thead>
						<tr>
							<th class="chk"><input type="checkbox"></th>
							<th class="detail">토픽명</th>
							<th class="public1">상태</th>
							<th class="public1">공개</th>
							<th class="date">날짜</th>
							<th class="del">삭제</th>
						</tr>
					</thead>
					<tbody class="border1">
						<%
							String t_idx = "";
							String t_title = "";
							String t_date = "";
							if (request.getParameter("t_idx") != null) {
								t_idx = request.getParameter("t_idx");
							}

							ResultSet rs2 = null;

							try {
								Class.forName("org.mariadb.jdbc.Driver");
								conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
								if (conn != null) {
									sql = "select *from topic";
									pstmt = conn.prepareStatement(sql);
									rs2 = pstmt.executeQuery();

									while (rs2.next()) {
										t_title = rs2.getString("t_title");
										t_idx = rs2.getString("t_idx");
										t_date = rs2.getString("t_date").substring(0, 10);
						%>
						<tr>
							<td class="chk"><input type="checkbox"></td>
							<td><a href="boardtopicmodify.jsp?t_idx=<%=rs2.getString("t_idx")%>"><strong><%=t_title%></strong></a></td>
							<td class="public1">●</td>
							<td class="public1">●</td>
							<td class="date"><%=t_date%></td>
							<td class="del"><a href="boardDell.jsp?idx=<%=rs2.getString("t_idx")%>&idx_dell=topic">삭제</a></td>
						</tr>
						<%
							}
								}
								pstmt.close();
								conn.close();
							} catch (Exception e) {
								out.println(e);
							}
						%>

					</tbody>
				</table>
				<div class="buttons">
					<div class="inner">
						<a href="" id="module_seemore">더보기</a>
					</div>
				</div>
			</section>
		</article>
</body>
</html>