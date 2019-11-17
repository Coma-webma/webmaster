0<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- 
BoardAccount 페이지를 위해 해야할 것 
1. BoardAccount.jsp에서 idx가 1인 사용자의 정보를 DB에서 꺼내와 html 부분에 뿌리기
	1) DB 연동 
	2) select * from user where idx=1 (idx가 1인 사람의 정보를 DB에서 가져오기)
	3) html에 부분에 넣기 ex)이메일 부분에서  rs.getString("u_email"); 이런 식으로 넣기. 
	4) 사용자가 계정 정보를 수정했을 경우 BoardAccoutnUpdate.jsp로 넘겨주기(저장 버튼을 누른 거면 수정한다는 의미겠죠?) //idx도 넘겨주세요. ex) response.sendRedirect("BoardAccountUpdate.jsp?idx=1");
2. BoardAccountUpdate.jsp를 생성하여 BoardAccount.jsp에서 넘어온 정보를 DB에 업데이트 하기
	1) DB연동
	2-1) BoardAccount.jsp에서 넘어온 정보를 String 변수에 저장하기 ex) String u_nickname 	= request.getParameter("u_nickname"); //request 객체 : client -> server 정보들
	2-2) BoardAccoutn.jsp에서 넘길 때 idx도 같이 넘겨줬으니 변수에 그걸 받아야겠죠? ex)String idx = request.getParameter("idx"); 콘솔에 idx를 찍으면 넘겨진 값이 찍힐 거에요(1로)
	3) DB에 정보 업데이트 하기 ex) 	sql = "UPDATE user set u_nickname = ? where idx = ? values(?, ?)"; //idx가 1인 사용자를 수정하는 것이기 때문.
	4) 다시 BoardAccount로 넘어가기 제대로 BoardAccount를 만드셨다면 수정된 데이터로 페이지에 뿌려지겠죠?
	
일단 이것만 먼저 하시고 더 추가하셔야합니다 
-->
<!DOCTYPE html>
<html>
<head>
<link href="css/account1.css" rel="stylesheet" type="text/css">
<link href="css/account.css" rel="stylesheet" type="text/css">
<link href="css/webtopmenu.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/webmenu.js"></script>
<meta charset="UTF-8">
<title>계정설정</title>
</head>
<body>
	<header>
		<div>
			<nav class="admin_left_nav">
				<ul class="topmenu">
					<li id="to_home"><a class="mainline" href="Main.jsp">COMA</a></li>
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
					<li><a href="boardmodulemain.html"><span
							class="menu_name ">모듈</span></a></li>
					<li><a href="boardcoursemain.html"><span class="menu_name">코스</span></a></li>
					<li><a class="active" href="boardAccount"><span
							class="menu_name">계정</span></a></li>
				</ul>
			</nav>
			<nav id="main_bar">
				<div></div>
			</nav>
		</div>
		<!-- 관리자모드 메인 -->


		<article>
			<hgroup id="img1">
				<h2>계정설정</h2>
			</hgroup>
			<section>
				<form id="form" method="post">
					<div class="edit_box">
						<dl>
							<dt>이메일</dt>
							<dd>@email.com</dd>
							<!--사용자이메일이메일 %>-->
						</dl>
						<dl>
							<dt>
								<label>닉네임</label>
							</dt>
							<dd>
								<input type="text" name="U_Nicname" value="닉네임">
							</dd>
							<!--사용자닉네임닉네임 %>-->
						</dl>
						<dl>
							<dt>
								<label>현재 비밀번호</label>
							</dt>
							<dd>
								<input type="text" name="U_pass">
							</dd>
						</dl>
						<dl>
							<dt>
								<label>새로운 비밀번호</label>
							</dt>
							<dd>
								<input type="text" name="U_pass_new">
							</dd>
						</dl>
						<dl>
							<dt>
								<label>새로운 비밀번호 확인</label>
							</dt>
							<dd>
								<input type="text" name="U_pass_n_ch">
							</dd>
						</dl>
						<dl>
							<dt>
								<label>자기소개</label>
							</dt>
							<dd>
								<textarea name="U_into"></textarea>
							</dd>
						</dl>
						<dl>
							<dt>
								<label>이메일 알림</label>
							</dt>
							<dd>
								<select name="email_notifi" id="email_notifi">
									<option value="on" selected>사용함</option>
									<option value="off">사용안함</option>
								</select>
							</dd>
						</dl>
					</div>
					<div class="edit_box" id="profile_edit_box">
						<dl>
							<dt>프로필 이미지</dt>
							<dd id="img_box">
								<div id="profile_img" src="">
									<img id="user_img" src="" alt>
								</div>
								<div id="file_upload">
									<button id="btn_profile">이미지 업로드</button>
								</div>
								<ul>
									<li>이미지의 용량은 1MB(1,024KB)를 넘을 수 없습니다.</li>
									<li>최적화된 이미지를 등록하시려면 크기를 160x160으로 맞춰주세요.</li>
									<li>허용되는 이미지 파일포맷은 GIF, JPEG, PNG입니다.</li>
								</ul>
							</dd>
						</dl>
					</div>
					<div class="btn_select">
						<div class="btn_select2">
							<button type="submit" class="btn save">저장</button>
						</div>
					</div>
				</form>
			</section>
		</article>
</body>

</html>