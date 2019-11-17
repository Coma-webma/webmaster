<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    import="java.sql.*"
%>
<%
	request.setCharacterEncoding("utf-8");
%>


<!DOCTYPE html>
<html>
<head>
<link href="css/Join.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/Join.js"></script>
<script type="text/javascript" src="jquery/jquery-3.4.1.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <div class="head">
        <header>
            <hgroup>
                 <p>
                    <a class="title" href="">회원가입</a>
                </p>
            </hgroup>
            <ul id="left_nav">
                <li id="to_home">
                    <a href="COMA.jsp">COMA</a>
                </li>
            </ul>
        </header>
    </div>
    <div id="cols">
        <div class="entry-area">
            <div class="layerbox">
                <form name="JoinForm" action="JoinCheck.jsp" method="POST" onsubmit="return checkNull()">
                    <div class="login_table">
                        <div class="header">
                            <strong>회원가입</strong>
                        </div>
                        <div class="check" id="check" style="display:none; text-align:center; font-size:13px; margin: 10px; color:red">
                        	<p id="check_nickname" style="display:none; margin-bottom:5px;"></p>
                        	<p id="check_email" style="display:none; margin-bottom:5px;"></p>
                        	<p id="check_pwd" style="display:none; margin-bottom:5px;"></p>
                        	<p id="check_Repwd" style="display:none; margin-bottom:5px;"></p>
                        </div>
                        <div class="body">
                            <dl>
                                <dt>
                                    <label for="nickname">닉네임</label>
                                </dt>
                                <dd>
                                    <input type="text" class="text" id="nickname" name="u_nickname">
                                </dd>
                                <dt>
                                    <label for="email">이메일</label>
                                </dt>
                                 <dd>
                                     <input type="text" class="text" id="email" name="u_email">
                                </dd>
                                <dt>
                                    <label for="pwd">비밀번호</label>
                                </dt>
                                 <dd>
                                     <input type="password" class="text" id="pwd" name="u_pwd">
                                </dd>
                                <dt>
                                    <label for="Repwd">비밀번호 확인</label>
                                </dt>
                                 <dd>
                                     <input type="password" class="text" id="Repwd" name="Repwd">
                                </dd>
                            </dl>
                            <div class="btn">
                                <p>
                                    <button type="submit" class="btn btn_submit" onclick="sendit()">가입하기</button>
                                </p>
                            </div>
                        </div>
                        <div class="footer">
                            <a class="a" href="FindPwd.jsp">비밀번호 찾기</a>
                            |
                            <a class="a" href="Login.jsp">로그인</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>