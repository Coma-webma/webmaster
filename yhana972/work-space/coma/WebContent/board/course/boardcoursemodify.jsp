<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/boardmain.css" rel="stylesheet" type="text/css">
<link href="../../css/course_add.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../../resize/plugin.js"></script>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8"); // 	request 클라이언트 -> 서버
	String c_idx = "";
	String c_title = "";
	String c_content = "";
	if (request.getParameter("c_idx") != null) {
		c_idx = request.getParameter("c_idx");
	}

	Connection conn = null; // db연결 시작
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/javatest", "root", "1234");
		if (conn != null) {
			sql = "select * from course";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../../js/boardcourse.js"></script>
</head>

<body>
	<header>
		<div>
			<nav class="admin_left_nav">
				<ul class="topmenu">
					<li><a class=line1 href="../../login/Main_login.jsp">COMA</a></li>
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
					<li><a href="../module/boardmodulemain.jsp"><span class="menu_name">모듈</span></a></li>
					<li><a class="active" href="boardcoursemain.jsp"><span
							class="menu_name">코스</span></a></li>
					<li><a href="../boardAccount.jsp"><span class="menu_name">계정</span></a></li>
				</ul>
			</nav>
			<nav>
				<ul class="menu_all">
					<li class="menu_all_add">
						<p>전체 코스 목록</p>
					</li>
					<div class="button1">
						<a href="boardcourse.jsp" style="color: white">추가</a>
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
										c_title = rs.getString("c_title");
						%>
						<a href="boardcoursemodify.jsp?c_idx=<%=rs.getString("c_idx")%>">
							<li>▶ <%=c_title%></li>
						</a>
						<%
							}
						%>
					</ul>
				</nav>



			</nav>
		</div>
		<!-- 관리자모드 메인 -->
		<article>
			<hgroup id="img1">
				<h2>코스수정</h2>
				<!-- 나중에 이름바꾸기 수정시-->
			</hgroup>
			<section>
				<%
					rs.beforeFirst();
							while (rs.next()) {
								if (c_idx.equals(rs.getString("c_idx"))) {
				%>
				<form name=boardcourseForm method="post" action="boardcoursemodify_ok.jsp?c_idx=<%=rs.getString("c_idx")%>" onsubmit="return sendit()">
					<dl>
						<dt>
							<input type="text" name="c_title" class="title" value="<%=rs.getString("c_title")%>">
						</dt>
					</dl>
					<div id=menu>
						<div id="textarea_x">
							<textarea name="c_content" class="form-control" id="p_content" style="resize: none;"><%=rs.getString("c_content")%></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('p_content', {
									height : 500
								});
							</script>
						</div>

					</div>
					<dl>
						<dt>
							<label>요약</label>
						</dt>
						<dd>
							<textarea name="c_summary"><%=rs.getString("c_summary")%></textarea>
						</dd>
					</dl>
					<dl>
						<dt>
							<label>공개설정</label>
						</dt>
						<dd class="dd1">
							<label><input type="radio" name="c_public" value="공개" checked>공개</label>
							<label><input type="radio" name="c_public" value="비공개">비공개</label>
						</dd>
					</dl>
					<dl>
						<dt>
							<label>모듈에 연결</label>
						</dt>
						<dd class="dd2">
							<a class="module" href="#">모듈 연결</a>
						</dd>
					</dl>
					<div class="btn_select">
						<div class="btn_select2">
							<button type="submit" class="btn save">저장</button>
							<button type="button" class="btn" id="delete" OnClick="window.location='../boardDell.jsp?idx=<%=rs.getString("c_idx")%>&idx_dell=course'">삭제</button>
						</div>
					</div>
				</form>
				<%
					}
							}
				%>
			</section>
		</article>
		<%
			}
			} catch (Exception e) {
				out.println(e);
			}
		%>
</body>
</html>