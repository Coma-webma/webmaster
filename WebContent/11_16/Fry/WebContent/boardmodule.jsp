<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="css/boardmain.css" rel="stylesheet" type="text/css">
<link href="css/module_add.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="resize/plugin.js"></script>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8"); // 	request 클라이언트 -> 서버

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
    <title>모듈 추가</title>
    <script src="js/boardmodule.js"></script>
</head>
<body>
<form name="boardmoduleForm" method="post" action="boardmodule_ok.jsp" onsubmit="return sendit()">
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
                    <li><a class="active" href="boardmodulemain.jsp"><span class="menu_name ">모듈</span></a></li>
                    <li><a href="boardcoursemain.jsp"><span class="menu_name">코스</span></a></li>
                    <li><a href="boardAccount.jsp"><span class="menu_name">계정</span></a></li>
                </ul>
            </nav>
            <nav>
                <ul class="menu_all">
                    <li class="menu_all_add">
                        <p>전체 모듈 목록</p>
                    </li>
                    <div class="button1"><a href="boardmodule.jsp" style="color:white">추가</a></div>
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
										String m_title = rs.getString("m_title");
						%>
						<a href="boardmodulemodify.jsp">
							<li>▶ <%=m_title%></li>
						</a>
					<%
						}
						pstmt.close();
						conn.close();
					}
				} catch (Exception e) {
					out.println(e);
				}
					%>
                    </ul>
                </nav>
        </div><!-- 관리자모드 메인 -->
        <article>
            <fieldset id="functions">
                <ul>
                    <li>
                        <input type="radio" id="function_basic" name="function" value="basic" checked="checked">
                        <label for="function_basic"><a href="boardmodulemodify.jsp" style="color:black">커버</a></label>
                    </li>
                    <li>
                        <input type="radio" id="function_topic" name="function" value="topic">
                        <label for="function_topic"><a href="boardtopicmain.jsp" style="color:black">토픽목록</a></label>
                    </li>
                </ul>
            </fieldset>
            <hgroup id="img1">
                <h2>전체</h2>
            </hgroup>
            <section>
                <dl>
                    <dt>
                        <input type="text" name="m_title" class="title">
                    </dt>
                </dl>
                <div id=menu>
                    <div id="textarea_x">
                        <textarea name="m_content" class="form-control" id="p_content" style="resize: none;"></textarea>
                        <script type="text/javascript">
                            CKEDITOR.replace('p_content', {
                                height: 500
                            });
                        </script>
                    </div>

                </div>
                <dl>
                    <dt>
                        <label>요약</label>
                    </dt>
                    <dd>
                        <textarea name="m_summary"></textarea>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <label>공개설정</label>
                    </dt>
                    <dd class="dd1">
                        <label><input type="radio" name="m_public" value="공개" checked>공개</label>
                        <label><input type="radio" name="m_public" value="비공개">비공개</label></p>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <label>바로가기</label>
                    </dt>
                    <dd class="dd3">
                        <a class="site" href="#">모듈에 해당하는 사이트로 보냄</a><!-- 해당하는 모듈에 페이지를 줌-->
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <label>댓글공지</label>
                    </dt>
                    <dd>
                        <textarea class="comment_no" name="m_notice"></textarea>
                        <!--댓글 창 위에 공지 띄우기-->
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <label>공동공부 타이틀</label>
                    </dt>
                    <dd>
                        <textarea name="m_together_title" class="text_size">공동공부</textarea><!--  삭제할지 말지 확인하기-->
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <label>봤어요 타이틀</label>
                    </dt>
                    <dd>
                        <textarea name="m_view_title" class="text_size">봤어요</textarea>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <label>커버 페이지</label><!-- 사용시 모듈 실행할 때 메인-->
                    </dt>
                    <dd class="dd1">
                        <label><input type="radio" name="use_cover" value="사용함" checked>사용함</label>
                        <label><input type="radio" name="use_cover" value="사용안함">사용안함</label></p>
                    </dd>
                </dl>
                <dl>
                    <dt>
                        <label>라이센스</label>
                    </dt>
                    <dd class="dd1">
                        <label><input type="checkbox" value="1">오픈 라이센스 사용에 동의합니다.</label>
                    </dd>
                </dl>
                <div class="btn_select">
                    <div class="btn_select2">
                        <button type="submit" class="btn save">저장</button>
                    </div>
                </div>
            </section>
        </article>
        </form>
</body>
</html>