<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	
%>
<!DOCTYPE html>
<link href="css/dec.css" rel="stylesheet" type="text/css">
<html lang="ko">

<head>
    <title>신고하기팝업</title>
</head>

<body>
    <h2>★신고하기★</h2>
    <div class="container">
        <form action="">
            <div class="row">
                <div class="col-25">
                    <label for="name">이메일(닉네임)</label>
                </div>
                <div class="col-75">
                    <input type="text" id="name" name="name" placeholder="이메일(닉네임)">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="name">제목</label>
                </div>
                <div class="col-75">
                    <input type="text" id="name" name="name" placeholder="신고합니다!!">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="lname">신고대상</label>
                </div>
                <div class="col-75">
                    <input type="text" id="lname" name="lname" placeholder="신고대상(이메일 or 닉네임)">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="subject">내용</label>
                </div>
                <div class="col-75">
                    <textarea id="subject" name="subject" placeholder="여기에 적어주세요!" style="height:200px"></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="name">신고유형</label>
                </div>
                <div class="col-75 radio_size">
                    <label><input type="radio" name="fruits" value="1" checked>부적절한 내용(관련없는 내용 ex, 물품 홍보, 성인물
                        기재)</label><br>
                    <label><input type="radio" name="fruits" value="2">컨텐츠 도용(여기서 제작한 컨텐츠는 상관이 없으나 이외의
                        곳에서<br>&emsp;&emsp; 컨텐츠를 끌여오는 경우저작권의 문제가 생길 수 있음)</label><br>
                    <label><input type="radio" name="fruits" value="3">개인 정보 노출</label><br>
                    <label><input type="radio" name="fruits" value="4">기타(직접입력)</label>
                </div>
            </div>
            <div class="row file_size">
                <div class="col-25">
                    <label for="name">이미지 침부</label>
                </div>
                <div class="col-75">
                    <input type="file" name="file">
                </div>
                <div class="col-25"></div>
                <div class="col-75">
                    <input type="file" name="file">
                </div>
                <div class="col-25"></div>
                <div class="col-75">
                    <input type="file" name="file">
                </div>
            </div>
            <div class="row">
                <input type="submit" value="신고하기">
            </div>
        </form>
    </div>
</body>
</html>