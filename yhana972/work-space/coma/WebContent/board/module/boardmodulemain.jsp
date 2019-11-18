<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8"); // 	request 클라이언트 -> 서버
	String m_idx = "";
	String m_title = "";
	String u_email = request.getParameter("u_email");
	System.out.println(u_email);
	
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
<link href="../../css/boardmain.css" rel="stylesheet" type="text/css">
<link href="../../css/topic_add.css" rel="stylesheet" type="text/css">
<link href="../../css/module.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../../resize/plugin.js"></script>
<head>
<meta charset="UTF-8">
<title>모듈메인</title>
</head>

<body>
	<header>
		<div>
			<nav class="admin_left_nav">
				<ul class="topmenu">
					<li id="to_home"><a class="mainline"
						href="../../login/Main_login.jsp?u_email=<%=u_email%>">COMA</a></li>
				</ul>
			</nav>
			<nav class="admin_right_nav">
				<ul class="topmenu">
					<li id="a"><span class="line1">내컨텐츠</span>
						<div id="mycontent_submenu" class="submenu layerbox"
							style="display: none;">
							<div class="pin pin_top"></div>
							<table>
								<thead>
									<tr>
										<th class="course"><span class="inner">코스</span>
											<div class="controls">
												<a class="setting" href="">설정</a> <a class="add" href="">추가</a>
											</div></th>
										<th class="module"><span class="inner">모듈</span>
											<div class="controls">
												<a class="setting" href="">설정</a> <a class="add" href="">추가</a>
											</div></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="course">
											<div id="p_course_nest" class="scrollbox">
												<ul>
													<li><a href="">코스1</a></li>
												</ul>
											</div>
										</td>
										<td class="module">
											<div id="p_module_nest" class="scrollbox">
												<div class="divider">소유중인 모듈</div>
												<menu class="menu3">
													<li><a href="">모듈 2</a></li>
													<li><a href="">모듈 2</a></li>
												</menu>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div></li>
					<li id="b"><span class="line1" href=#>참여활동</span>
						<div id="act_submenu" class="submenu layerbox"
							style="display: none;">
							<div class="pin pin_top"></div>
							<table>
								<thead>
									<tr>
										<th class="study"><span class="inner">공동공부</span></th>
										<th class=marking><span class="inner">봤어요</span> <span
											class="subtitle"> 누적봤어요 <span class="count">1</span>번
										</span></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="study">
											<div id="p_study_nest" class="scrollbox">
												<menu class="menu">
													<li><a href="#">듣고있는 것</a>
														<div class="archieved">
															<span class="percentage">&nbsp; 15%</span> <span
																class="graph"> <span class="bar"
																style="width: 15%;"></span>
															</span>
														</div></li>
													<li><a href="#">듣고있는 것</a>
														<div class="archieved">
															<span class="percentage">50%</span> <span class="graph">
																<span class="bar" style="width: 50%;"></span>
															</span>
														</div></li>
												</menu>
											</div>
										</td>
										<td class="marking">
											<div id="p_marking_nest" class=scrollbox>
												<menu class="menu2">
													<li><a href="#">듣고있는것의 코스이름</a></li>
													<li><a href="#">듣고있는것의 코스이름</a></li>
												</menu>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div></li>
					<li id="c"><span class="line2" href=#>닉네임</span>
						<div id="niName_submenu" class="submenu layerbox"
							style="display: none;">
							<div class="pin pin_top"></div>
							<div class="table">
								<menu>
									<li><a href="boardtopicmain.html">관리자</a></li>
									<li><a href="#">로그아웃</a></li>
								</menu>
							</div>
						</div></li>
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
					<li><a href="../course/boardcoursemain.jsp"><span
							class="menu_name">코스</span></a></li>
					<li><a href="../boardAccount.jsp"><span class="menu_name">계정</span></a></li>
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
						%>
					</ul>
				</nav>
		</div>
		<!-- 관리자모드 메인 -->
		<article>
			<div class="a16">
				<img src="../../img/board/picture01.jpg" width=35px; heigth="35px">
			</div>
			<span class="a8">
				<p>모듈 전체</p>
			</span>
			<div class="a9">
				<p class="a10">
					선택된 항목을 <select>
						<option value="top">선택한 항목에 대한 작업</option>
						<option value="low">공개</option>
						<option value="up">비공개</option>
					</select>
				</p>
				<p class="a11">
					<label><input type="checkbox" value="공개" checked>공개</label>
					<label><input type="checkbox" value="비공개" checked>비공개</label>
				</p>
			</div>
			<table class="a12">
				<thead>
					<tr>
						<th class="chk"><input type="checkbox"></th>
						<th class="main_img">대표이미지</th>
						<th class="detail">모듈명</th>
						<th class="topic">토픽수</th>
						<th class="public">공개</th>
						<th class="date">최종변경일</th>
					</tr>
				</thead>
				<tbody class="border1">
					<%
						rs.beforeFirst();
								while (rs.next()) {
									m_title = rs.getString("m_title");
									m_idx = rs.getString("m_idx");
									String m_date = rs.getString("m_date").substring(0, 10);
					%>
					<tr>
						<td class="chk"><input type="checkbox"></td>
						<td class="main_img">대표이미지</td>
						<td class="detail"><a
							href="boardmodulemodify.jsp?m_idx=<%=rs.getString("m_idx")%>"><strong><%=m_title%></strong></a></td>
						<td class="topic">2</td>
						<td class="public">●</td>
						<td class="date"><%=m_date%></td>
					</tr>
					<%
						}
								pstmt.close();
								conn.close();
							}
						} catch (Exception e) {
							out.println(e);
						}
					%>
				</tbody>
			</table>
		</article>
</body>
</html>