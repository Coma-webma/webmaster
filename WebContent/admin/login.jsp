<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<link href="css/Login.css" rel="stylesheet" type="text/css">
<link href="css/font.css" rel="stylesheet" type="text/css">
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
                <form name="" method="post" action="login_ok.jsp">
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
                                    <input type="text" class="text" name="id" value>
                                </dd>
                                <dt>
                                        <label for="pwd">비밀번호</label>
                                    </dt>
                                    <dd>
                                        <input type="password" class="text" name="pwd" value>
                                    </dd>
                            </dl>
                            <div class="btn">
                                <p>
                                    <input type="submit" value="로그인" class="btn btn_submit"></input>
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
</body>
</html>