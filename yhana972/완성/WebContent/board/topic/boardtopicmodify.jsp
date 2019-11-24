<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="../../css/boardmain.css" rel="stylesheet" type="text/css">
<link href="../../css/topic_add.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../../resize/plugin.js"></script>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8"); // 	request 클라이언트 -> 서버
	String t_idx = "";
	String t_title = "";
	String t_content = "";
	if (request.getParameter("t_idx") != null) {
		t_idx = request.getParameter("t_idx");
	}

	Connection conn = null; // db연결 시작
	String sql = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/coma", "root", "1234");
		if (conn != null) {
			sql = "select * from topic";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>모듈>토픽수정</title>
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
					<li><a class="active" href="../module/boardmodulemain.jsp"><span
							class="menu_name ">모듈</span></a></li>
					<li><a href="../course/boardcoursemain.jsp"><span class="menu_name">코스</span></a></li>
					<li><a href="../boardAccount.jsp"><span class="menu_name">계정</span></a></li>
				</ul>
			</nav>
			<nav>
				<ul class="menu_all">
					<li class="menu_all_add">
						<p>전체 모듈 목록</p>
					</li>
					<div class="button1">
						<a href="../module/boardmodule.jsp" style="color: white">추가</a>
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
										t_title = rs.getString("t_title");
						%>
						<a href="boardtopicmodify.jsp?t_idx=<%=rs.getString("t_idx")%>">
							<li>▶ <%=t_title%></li>
						</a>
						<%
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
						value="basic"> <label for="function_basic">커버</label></li>
					<li><input type="radio" id="function_topic" name="function"
						value="topic" checked="checked"> <label
						for="function_topic">토픽목록</label></li>
				</ul>
			</fieldset>
			<hgroup id="img1">
				<h2>모듈 > 모듈이름 > 토픽이름 >토픽수정</h2>
				<!-- 모듈이름 추가-->
			</hgroup>
			<section>
							<%
					rs.beforeFirst();
							while (rs.next()) {
								if (t_idx.equals(rs.getString("t_idx"))) {
				%>
				<form name=boardtopicForm method="post" action="boardtopicmodify_ok.jsp?t_idx=<%=rs.getString("t_idx")%>" onsubmit="return sendit()">
				<dl>
					<dt>
						<input type="text" name="t_title" class="title" value="<%=rs.getString("t_title")%>">
					</dt>
				</dl>
				<div id=menu>
					<div id="textarea_x">
						<textarea name="t_content" class="form-control" id="p_content" style="resize: none;"><%=rs.getString("t_content")%></textarea>
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
						<textarea name="t_summary"><%=rs.getString("t_summary")%></textarea>
					</dd>
				</dl>
				<dl>
					<dt>
						<label>동영상</label>
					</dt>
					<dd>
						<textarea class="video"></textarea>
						<!--댓글 창 위에 공지 띄우기-->

						<button class="module" href="#">동영상 추가</button>
					</dd>
				</dl>
				<dl>
					<dt>
						<label>공개설정</label>
					</dt>
					<dd class="dd1">
						<label><input type="radio" name="t_public" value="공개" checked>공개</label>
						<label><input type="radio" name="t_public" value="비공개">비공개</label>
						</p>
					</dd>
				</dl>
				<dl>
					<dt>
						<label>준비설정</label>
					</dt>
					<dd class="dd1">
						<label><input type="radio" name="t_cover" value="완료" checked>완료</label>
						<label><input type="radio" name="t_cover" value="준비중">준비중</label>
						</p>
					</dd>
				</dl>
				<div class="btn_select">
					<div class="btn_select2">
						<button type="submit" class="btn save">저장</button>
						<button type="button" class="btn" id="cancel">취소</button>
						<!-- <button type="button" class="btn" id="delete">삭제</button> -->
						<button type="button" class="btn save" OnClick="window.location='../boardDell.jsp?idx=<%=rs.getString("t_idx")%>&idx_dell=topic'">삭제</button>
						<!-- 처음에는 없다가 나중에 나타남 -->
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