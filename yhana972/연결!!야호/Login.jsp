<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/Login.css" rel="stylesheet" type="text/css">
<link href="css/font.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/login.js"></script>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
    <div class="head">
        <header>
            <hgroup>
                 <p>
                    <a class="title" href>로그인</a>
                </p>
            </hgroup>
            <ul id="left_nav">
                <li id="to_home">
                    <a href="COMA.html">COMA</a>
                </li>
            </ul>
        </header>
    </div>
    <div id="cols">
        <div class="entry-area">
            <div class="layerbox">
                <form action="" method="POST">
                    <div class="login_table">
                        <div class="header">
                            <strong>로그인</strong>
                            <p class="rememberme">
                                <input type="checkbox" id="remeberme" name="remeberme" value="on">
                                <label for="remeberme">로그인 상태 유지</label>
                            </p>
                        </div>
                        <div class="body">
                            <dl>
                                <dt>
                                    <label for="email">아이디 (이메일)</label>
                                </dt>
                                <dd>
                                    <input type="text" class="text" id="email" name="email" value>
                                </dd>
                                <dt>
                                        <label for="pwd">비밀번호</label>
                                    </dt>
                                    <dd>
                                        <input type="password" class="text" id="pwd" name="pwd" value>
                                    </dd>
                            </dl>
                            <div class="btn">
                                <p>
                                    <button type="submit" id class="btn btn_submit">로그인</button>
                                </p>
                            </div>
                        </div>
                        <div class="footer">
                            <a class="a" href="FindPwd.html">비밀번호 찾기</a>
                            |
                            <a class="a" href="Join.html">회원가입</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
     <!--로그인 실패 시 뜨는 다이얼로그 창-->
     <div class="fail_login" style="width: 300px; top:300px; left: 610px; z-index: 10000; display: none;">
        <div class="fail_login_head"></div>
        <div class="fail_login_body">로그인에 실패하셨습니다. 아이디(이메일)와 비밀번호를 다시 확인해주세요.</div>
        <div class="fail_login_foot">
            <button class="fail_login_close">닫기</button>
        </div>
    </div>
</body>
</html>