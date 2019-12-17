<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String u_email = "";
	String u_nickname = "";
	if (session.getAttribute("u_email") != null) {
		u_email = (String) session.getAttribute("u_email"); // 실제 로그인한 아이디가 저장되어 있습니다.
	}
	Connection conn = null;
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
		if (conn != null) {
			//out.println("DB연결 성공!!");
			sql = "SELECT u_nickname FROM user WHERE u_email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				u_nickname = rs.getString("u_nickname");
			}
		}
		pstmt.close();
		conn.close();
	} catch (Exception e) {
		out.println(e);
	}
%>
<!DOCTYPE html>
<html>

<head>
<link href="../css/webmaster.css" rel="stylesheet" type="text/css">
<link href="../css/webtop.css" rel="stylesheet" type="text/css">
<link href="../css/webtopmenu.css" rel="stylesheet" type="text/css">
<link href="../css/font.css" rel="stylesheet" type="text/css">
<link href="../css/course_all.css" rel="stylesheet" type="text/css">
<script src="../jquery/jquery-3.4.1.min.js"></script>
<script src="../js/webmenu.js"></script>
<meta charset="UTF-8">
<title>웹 마스터</title>
</head>

<body>
	<div class="top">
		<header>
			<div>
				<nav class="left_nav1">
					<ul class="topmenu">
						<li id="to_home"><a class="mainline"
							href="Main_login.jsp?u_email=<%=u_email%>">COMA</a></li>
						<li id="course_allview"><a class="img" href=#>전체보기</a></li>
					</ul>
				</nav>
				<nav class="right_nav1">
					<ul class="topmenu">
						<li><a href="../dec.jsp" class="line1"
							onclick="popup(this.href,620,500,'scroll'); return false;">신고하기</a></li>
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
						<li id="c"><span class="line2" href=#><%=u_nickname%></span>
							<div id="niName_submenu" class="submenu layerbox"
								style="display: none;">
								<div class="pin pin_top"></div>
								<div class="table">
									<menu>
										<li><a href="boardtopicmain.jsp">관리자</a></li>
										<li><a href="#">로그아웃</a></li>
									</menu>
								</div>
							</div></li>
					</ul>
				</nav>
			</div>
			<div class="title_main">
				<p class="title1">
					<a href="WebMaster_login.jsp?u_email=<%=u_email%>">웹 마스터 1</a>
				</p>
				<!-- 줄간격 해야함 -->
				<p class="title2">Web Master</p>
			</div>
			<nav class="main_nav1 menubar">
				<div class="course2">
					<ul class="topmenu1">
						<li id="course1-1">
							<div class="label">
								<a class=" line3"
									href="WebMasterSide_login.jsp?u_email=<%=u_email%>">프론트엔드
									1-1</a>
							</div>
							<div id="1" class="sub_nav depth_1"
								style="position: absolute; width: 199px; display: none;"
								loaded="true">
								<div class="pin"></div>
								<ul class="sub_nav">
									<li>
										<div class="label">
											<a href="WebMasterSide_login.jsp?u_email=<%=u_email%>">HTML
												1-1-1</a>
										</div>
										<div class="sub_nav depth_2">
											<ul class="sub_nav">
												<li>
													<div class="label">
														<a href="#">HTML 1-1-1-1</a>
													</div>
												</li>
												<li>
													<div class="label">
														<a href="#">HTML 1-1-1-1</a>
													</div>
												</li>
											</ul>
										</div>
									</li>
									<li>
										<div class="label">
											<a href="#">CSS 1-1-2</a>
										</div>
									</li>
									<li>
										<div class="label">
											<a href="#">javaScript1-1-3</a>
									</li>
									<li>
										<div class="label">
											<a href="#">메뉴1-4</a>
									</li>
									<li>
										<div class="label">
											<a href="#">메뉴1-5</a>
										</div>
									</li>
									<li>
										<div class="label">
											<a href="#">메뉴1-6</a>
										</div>
									</li>
								</ul>
							</div>
						</li>
						<li><a class="line3" href=#>백엔드 2-1</a></li>
						<li><a class="line3" href=#>메뉴3</a></li>
						<li><a class="line3" href=#>메뉴4</a></li>
						<li><a class="line3" href=#>메뉴5</a></li>
						<li><a class="line4" href=#>메뉴6</a></li>
					</ul>
				</div>
			</nav>
		</header>
	</div>
	<!-- 전체 메뉴 수정 부분  -->
	<div id="all_menus" class="registered_layer" style="display: none;">
		<div class="pin2"></div>
		<div class="wrapper3">
			<hgroup>
				<h3>코스 전체목록</h3>
				<a class="btn_close"><span>닫기</span></a>
			</hgroup>
			<div class="section">
				<div class="wrapper">
					<div class="group">
						<div class="public course_title">
							<a href="">WEB<span class=""></span></a>
						</div>
						<ul class="sub_nav">
							<li>
								<div class="label public">
									<a class="courselink" href="">WEB1 - HTML & Internet <span></span>
									</a>
								</div>
							</li>
							<li>
								<div class="label public">
									<a class="courselink" href="">WEB2 - CSS <span></span>
									</a>
								</div>
							</li>
						</ul>
					</div>
					<!-- 코스1_1 안에있는것들-->
					<div class="group">
						<div class="public course_title">
							<a href="">WEB<span class=""></span></a>
						</div>
						<ul class="sub_nav">
							<li>
								<div class="label public">
									<a class="courselink" href="">WEB1 - HTML & Internet <span></span>
									</a>
								</div>
								<div class="sub_nav depth_2 ">
									<ul class="sub_nav">
										<li>
											<div class="label public">
												<a class="courselink" href="">Ajax <span></span>
												</a>
											</div>
										</li>
										<li>
											<div class="label public">
												<a class="courselink" href="">Login <span></span>
												</a>
											</div>
										</li>
									</ul>
								</div>
							</li>
							<li>
								<div class="label public">
									<a class="courselink" href="">WEB2 - CSS <span></span>
									</a>
								</div>
							</li>
							<li>
								<div class="label public">
									<a class="courselink" href="">WEB2 - CSS <span></span>
									</a>
								</div>
							</li>
							<li>
								<div class="label public">
									<a class="courselink" href="">WEB2 - CSS <span></span>
									</a>
								</div>
							</li>
							<li>
								<div class="label public">
									<a class="courselink" href="">WEB2 - CSS <span></span>
									</a>
								</div>
							</li>
							<li>
								<div class="label public">
									<a class="courselink" href="">WEB2 - CSS <span></span>
									</a>
								</div>
							</li>
							<li>
								<div class="label public">
									<a class="courselink" href="">WEB2 - CSS <span></span>
									</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div class="dir">
		<div class="dir_main">
			<span id="breadcrumb_line"> WebMaster <span class="divider">></span>
				프론트엔드 1-1
			</span>

		</div>
	</div>
	<div class="middle">
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p style="text-align: center">
			<img alt="" height="150"
				src="https://s3-ap-northeast-2.amazonaws.com/opentutorials-user-file/course/1/5641.png"
				width="150" />
		</p>
		<p style="text-align: center;">hello world</p>
		<p style="text-align: center;">&nbsp;</p>
		<p>&nbsp;</p>
		<div class="revious_next">
			<div class="revious_next_right">
				<div class="revious">
					<p class="back">
						<a href=#>◀ 이전</a>
					</p>
				</div>
				<div class="next">
					<p class="back">
						<a href=#>다음 ▶</a>
					</p>
				</div>
			</div>
		</div>
		<div class="comment1">
			<div class="comment1_1">
				<img src="../img/dasktop/pro.png">
			</div>
			<div class="comment1_2">
				<textarea></textarea>
			</div>
			<div class="comment1_button">
				<button type="submit">
					<span>댓글 올리기</span>
				</button>
			</div>
		</div>
		<ol id="comment_list">
			<li id="00">
				<div class="comment2">
					<div class="comment2_1">
						<img src="../img/dasktop/pro.png">
					</div>
					<div class="comment2_2">닉네임</div>
					<div class="comment2_3">2019-10-29</div>
					<div class="comment2_4">
						댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~댓글입니다~
					</div>
					<div class="com_buttons" style="display: block;">
						<a class="icon reply" href="#"> <span class="ico ico_reply"></span>
							답글
						</a>
					</div>
				</div>
			</li>
			<li id="01">
				<div class="comment2">
					<div class="comment2_1">
						<img src="../img/dasktop/pro.png">
					</div>
					<div class="comment2_2">닉네임dd</div>
					<div class="comment2_3">2019-10-29</div>
					<div class="com_buttons" style="display: block;">
						<a class="icon reply" href="#"> <span class="ico ico_reply"></span>
							답글
						</a>
					</div>
					<div class="comment2_4">댓글입니다~</div>
				</div>
			</li>
		</ol>
		<div class="footer">
			<a href="#">더보기</a>
		</div>
	</div>
</body>

</html>