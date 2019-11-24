<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>모듈전체</title>
<link href="css/list01.css" rel="stylesheet" type="text/css">
<link href="css/list02.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<div>
			<nav class="admin_left_nav">
				<ul class="topmenu">
					<li><a class=line1 href="login/Main_login.jsp?u_email=admin@gmail.com">COMA</a></li>
				</ul>
			</nav>
			<nav class="admin_right_nav">
				<!-- 
                <ul class="topmenu">
                        <li><a  class=line1 href=#>내컨텐츠</a></li>
                        <li><a  class=line1 href=#>참여활동</a></li>
                        <li><a  class=line1 href=#>닉네임</a></li>
                        <li><a  class=line2 href=#>관리자이름</a>
                            <ul>
                                <li><a href="#">팝업창</a></li>
                                <li><a href="#">로그아웃</a></li>
                            </ul>
                  </li>
                </ul>
                 -->

			</nav>
		</div>
	</header>
	<div id=contant>
		<div>
			<nav id=main>
				<ul class=admin_menu>
					<li><a class="active" href="list01_02.jsp"><span
							class="menu_name1 ">회원목록</span></a></li>
					<!-- 
                <li><a class="active" href="list02_02.jsp"><span class="menu_name ">black list</span></a></li>
                <li><a href="#"><span class="menu_name">신고하기</span></a></li>
                 -->
				</ul>
			</nav>
		</div>
		<!-- 관리자모드 메인 -->
	</div>
	<article>
		<hgroup>
			<iframe id="ifrm" src="list01_01.jsp"
				style="width: 100%; height: 700px; margin-left: 260px"
				frameborder="0"></iframe>
		</hgroup>
	</article>
</body>
</html>