<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>

<head>
	<link href="../css/webmaster_side.css" rel="stylesheet" type="text/css">
	<link href="../css/font.css" rel="stylesheet" type="text/css">
	<link href="../css/together_study.css" rel="stylesheet" type="text/css">
	<link href="../css/webtop.css" rel="stylesheet" type="text/css">
	<link href="../css/webtopmenu.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="../jquery/jquery-3.4.1.min.js"></script>
	<script src="../js/webmenu.js"></script>
	<!--공동공부 script-->
	<meta charset="UTF-8">
	<title>웹 마스터_사이드</title>
</head>

<body>
	<div class="top">
		<header>
			<div>
				<nav class="left_nav1">
					<ul class="topmenu">
						<li id="to_home"><a class="mainline" href="../index.jsp">COMA</a></li>
						<li><a class="img" href=#>전체보기</a></li>
					</ul>
				</nav>
				<nav class="right_nav1">
					<ul class="topmenu">
						<li><a href="../dec.jsp" class="line1"
								onclick="popup(this.href,620,500,'scroll'); return false;">신고하기</a></li>
						<li><a class="line1" href="../member/Login.jsp?jsp=WebMasterSide_logout.jsp">LOGIN</a></li>
	</ul>
	</nav>
	</div>
	<div class="title_main">
		<p class="title1"><a href="WebMaster_logout.jsp">웹 마스터 1</a></p><!-- 줄간격 해야함 -->
		<p class="title2">Web Master</p>
	</div>
	<nav class="main_nav1 menubar">
		<div class="course2">
			<ul class="topmenu1">
				<li id="course1-1">
					<div class="label">
						<a class=" line3" href="WebMasterSide_logout.jsp">프론트엔드 1-1</a>
					</div>
					<div id="1" class="sub_nav depth_1" style="position:absolute; width: 199px; display: none;"
						loaded="true">
						<div class="pin"></div>
						<ul class="sub_nav">
							<li>
								<div class="label">
									<a href="WebMasterSide_logout.jsp">HTML 1-1-1</a>
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
									<a href="#">CSS 1-1-2</a></div>
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
									<a href="#">메뉴1-5</a></div>
							</li>
							<li>
								<div class="label">
									<a href="#">메뉴1-6</a></div>
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
	<div class="dir">
		<div class="dir_main">
			<span id="breadcrumb_line">
				WebMaster
				<span class="divider">></span>
				프론트엔드 1-1
				<span class="divider">></span>
				커버페이지
			</span>
			<div class="dir_main_img">
				<img src="../img/dasktop/study_check_off.png">
				<div class="dir_main_right">
					<a href="#popup_together">공동공부
						<small>
							(
							<span class="count">50000</span>
							명)
						</small>
					</a>
				</div>
			</div>
		</div>
	</div>
	<div class="middle">
		<aside>
			<div class="left_side">
				<div class="left_side_title"><a href="">커버페이지</a></div>
				<div class="left_side1">
					<p class="left_side1_title">토픽의 목록</p>
					<nav class="side_nav">
						<li class="side_nav_list"><a href="">토픽1</a></li>
						<li class="side_nav_list"><a href="">토픽2</a></li>
						<li class="side_nav_list"><a href="">토픽3</a></li>
						<div class="side_nav_list_name1">
							<p>생산자</p>
							<div class="side_nav_list_profile_icon">
								<img src="../img/dasktop/pro.png">
								<!--사이트에서 사진넣고 배경색 삭제 해보기-->
							</div>
							<ul>
								<li class="side_nav_list2">
									<div class="side_nav_list_name2">
										닉네임
									</div>
									<div class="side_nav_list2_statics">
										토픽 2918 &nbsp;/&nbsp; 봤어요 319
									</div>
									<script>
										$(function () {
											$(".left_side_title >").click(function () {
												$(this).addClass("select")
											});
										});
									</script>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
		</aside>
		<div class="content">
			<div class="content_title">
				<h1>프론트엔드 1-1 의 밑에 내용</h1>
				<div class="content_title_time">
					<time>2018-03-26 06:51:14</time>
					<span> |
						<span class="tag"> 공개 </span>
					</span>
				</div>
			</div>
			<div class="content_content">
				<p>이것은 프론트엔드 1-1의 코스 입니다.</p>
				<p>왼쪽의 토픽1,2,3 은 프론트엔드의 모듈 입니다.</p>
			</div>
			<div class="revious_next">
				<div class="revious_next_right">
					<div class="see">
						<a class="marking2" href="#">
							<span class="action">봤어요</span>
							(
							<span class="count">11</span>
							명)

						</a>
					</div>
					<div class="revious">
						<p class="back"><a href=#>◀ 이전</a></p>
					</div>
					<div class="next">
						<p class="back"><a href=#>다음 ▶</a></p>
					</div>
				</div>
			</div>
			<div class="comment1">
				<div class="comment1_1"><img src="../img/dasktop/pro.png"></div>
				<div class="comment1_2">
					<textarea></textarea>
				</div>
				<div class="comment1_button">
					<button type="submit">
						<span>댓글 올리기</span>
					</button>
				</div>
			</div>
			<div class="comment2">
				<div class="comment2_1"><img src="../img/dasktop/pro.png"></div>
				<div class="comment2_2">
					닉네임
				</div>
				<div class="comment2_3">
					2019-10-29
				</div>
				<div class="comment2_4">
					댓글입니다~
				</div>
			</div>
			<div class="footer">
				<a href="#">더보기</a>
			</div>
		</div>
	</div>
	</div>
	<!--공동 공부 팝업-->
	<div class="popup" id="popup_together" style="width: 980px; height: 500px; left: 20%; display: none;">
		<div class="wrapper">
			<div class="header">
				<strong>공동공부</strong>
			</div>
			<div class="body">
				<div class="study_bar" style="width: 180px; height: 450px;">
					<ul style="padding-top: 12.5px; padding-bottom: 12.5px;">
						<li style="height: 25px;">
							<span class="cell">
								<a class="cell" href>수업의 목적</a>
							</span>
						</li>
						<li style="height: 25px;">
							<span class="cell">
								<a class="cell" href>이렇게 쓰자</a>
							</span>
						</li>
					</ul>
				</div>
				<div class="graph" style="width: 640px; height: 450px;">
					<div class="graph_wrap">
						<svg height="800" version="1.1" width="12100" xmlns="http://www.w3.org/2000/svg"
							style="overflow: hidden; position: relative; left: -0.4px;">
							<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.1.0
							</desc>
							<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
							<!--가로줄-->
							<path fill="none" stroke="#dddddd" d="M0,0L12100,0" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,25L12100,25" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,50L12100,50" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,50L12100,50" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,75L12100,75" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,100L12100,100" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,125L12100,125" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,150L12100,150" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,175L12100,175" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,200L12100,200" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,225L12100,225" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,250L12100,250" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,275L12100,275" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,300L12100,300" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,325L12100,325" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,350L12100,350" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,375L12100,375" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,400L12100,400" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,425L12100,425" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<path fill="none" stroke="#dddddd" d="M0,450L12100,450" stroke-dasharray="3,1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
							<!--세로줄(rect), 원(circle)-->
							<rect x="60" y="0" width="0.5" height="800" r="0" rx="0" ry="0" fill="#dcdcdc" stroke="#000"
								stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></rect>

							<rect x="120" y="0" width="0.5" height="800" r="0" rx="0" ry="0" fill="#dcdcdc"
								stroke="#000" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
							</rect>
							<circle cx="120" cy="25" r="5" fill="#93c8e0" stroke="#93c8e0" stroke-width="1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<rect x="180" y="0" width="0.5" height="800" r="0" rx="0" ry="0" fill="#dcdcdc"
								stroke="#000" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
							</rect>
							<circle cx="180" cy="25" r="5" fill="#93c8e0" stroke="#93c8e0" stroke-width="1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<circle cx="180" cy="50" r="5" fill="#93c8e0" stroke="#93c8e0" stroke-width="1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<rect x="240" y="0" width="0.5" height="800" r="0" rx="0" ry="0" fill="#dcdcdc"
								stroke="#000" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
							</rect>
							<circle cx="240" cy="50" r="5" fill="#93c8e0" stroke="#93c8e0" stroke-width="1"
								style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></circle>
							<rect x="300" y="0" width="0.5" height="800" r="0" rx="0" ry="0" fill="#dcdcdc"
								stroke="#000" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
							</rect>
							<rect x="360" y="0" width="0.5" height="800" r="0" rx="0" ry="0" fill="#dcdcdc"
								stroke="#000" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
							</rect>
							<rect x="420" y="0" width="0.5" height="800" r="0" rx="0" ry="0" fill="#dcdcdc"
								stroke="#000" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
							</rect>
							<rect x="480" y="0" width="0.5" height="800" r="0" rx="0" ry="0" fill="#dcdcdc"
								stroke="#000" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
							</rect>
							<rect x="540" y="0" width="0.5" height="800" r="0" rx="0" ry="0" fill="#dcdcdc"
								stroke="#000" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
							</rect>
							<rect x="600" y="0" width="0.5" height="800" r="0" rx="0" ry="0" fill="#dcdcdc"
								stroke="#000" stroke-width="0" style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
							</rect>
						</svg>
						<button class="join" style="top: 111px; left: 35px;">참여</button>
					</div>
				</div>
				<div class="x_bar" style="width:460;">
					<ul>
						<li class="dummy" style="width: 30px;"></li>
						<li style="width: 55px;">
							<strong>You</strong>
						</li>
						<!--변경-->
						<li style="width: 55px;">기현</li>
						<li style="width: 55px;">나현</li>
						<li style="width: 55px;">태경</li>
						<li style="width: 55px;">수빈</li>
						<li style="width: 55px;">유하</li>
						<li style="width: 55px;">찬성</li>
					</ul>
				</div>
				<div class="goodjob_guys" style="width:159px">
					<Strong class="title">명예의 전당
						<span class="count">(324)</span>
					</Strong>
					<div class="good_wrap" style="height: 406px;">
						<ul>
							<li>
								<img class="user_pic" src="../img/user_pic.png" width="32" height="32" alt>
								<strong>기현</strong>
								<small><time>2019-10-31 17:41:30 </time></small>
							</li>
							<li>
								<img class="user_pic" src="../img/user_pic.png" width="32" height="32" alt>
								<strong>나현</strong>
								<small><time>2019-10-31 17:50:20 </time></small>
							</li>
							<li>
								<img class="user_pic" src="../img/user_pic.png" width="32" height="32" alt>
								<strong>태경</strong>
								<small><time>2019-10-31 17:51:20 </time></small>
							</li>
							<li>
								<img class="user_pic" src="../img/user_pic.png" width="32" height="32" alt>
								<strong>수빈</strong>
								<small><time>2019-10-31 17:51:28 </time></small>
							</li>
							<li>
								<img class="user_pic" src="../img/user_pic.png" width="32" height="32" alt>
								<strong>유하</strong>
								<small><time>2019-10-31 17:52:02 </time></small>
							</li>
							<li>
								<img class="user_pic" src="../img/user_pic.png" width="32" height="32" alt>
								<strong>찬성</strong>
								<small><time>2019-10-31 17:52:55 </time></small>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="foot">
				<button class="close">닫기</button>
			</div>
		</div>
	</div>
</body>

</html>