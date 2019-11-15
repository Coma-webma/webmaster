<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    import="java.sql.*"
%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="css/coma.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
    <div class="header"><a class="line1" href=#>Login</a></div>
    <table class="main">

    <tr>
        <td height="135"></td>
    </tr>
    <tr>
        <td id="logo" value="coma">
        </td>
    </tr>
    <tr>
        <td id="search"><input type="text" maxlength="90" placeholder="   검색 혹은 입력"> </td>
    </tr>
    <tr>
        <td height="40"></td>
    </tr>
    <tr>
        <td id="course">
            <!--하나의창-->
            <div class="card">
                <div>
                    <strong id="name"><a href="">course입니다아</a></strong>
                </div>
               <div class="name_card">
                   <img  class="" src="" width="45px" height="45px">
                   <strong id="name">닉네임닉네임닏네임</strong>
               </div>
            </div><!--하나의창(추가시 이거가지고가기-->
             <!--하나의창-->
             <div class="card">
                    <div>
                        <strong id="name"><a href="">course입니다아</a></strong>
                    </div>
                   <div class="name_card">
                       <img  class="" src="" width="45px" height="45px">
                       <strong id="name">닉네임닉네임닏네임</strong>
                   </div>
                </div>
                 <!--하나의창-->
            <div class="card">
                    <div>
                        <strong id="name"><a href="">course입니다아</a></strong>
                    </div>
                   <div class="name_card">
                       <img  class="" src="" width="45px" height="45px">
                       <strong id="name">닉네임닉네임닏네임</strong>
                   </div>
                </div>
            
        </td>
    </tr>
    <tr>
        <td id="course">
 <!--하나의창-->
 <div class="card">
        <div>
            <strong id="name"><a href="">course입니다아</a></strong>
        </div>
       <div class="name_card">
           <img  class="" src="" width="45px" height="45px">
           <strong id="name">닉네임닉네임닏네임</strong>
       </div>
    </div>
     <!--하나의창-->
     <div class="card">
            <div>
                <strong id="name"><a href="">course입니다아</a></strong>
            </div>
           <div class="name_card">
               <img  class="" src="" width="45px" height="45px">
               <strong id="name">닉네임닉네임닏네임</strong>
           </div>
        </div>
         <!--더보기-->
<script>
    $(function(){
$("div.card_add").click(function(){
$("td.plus").css("display","block");
return false;
});
    });
</script>
         <div class="add">
                <div class="card_add" >+</div>
            </div>

        </td>
    </tr>
     <tr>
            <td id="course" class="plus" style="display: none;">
    <!--하나의창-->
    <div class="card">
        <div>
            <strong id="name"><a href="">course입니다아</a></strong>
        </div>
        <div class="name_card">
            <img  class="" src="" width="45px" height="45px">
            <strong id="name">닉네임닉네임닏네임</strong>
        </div>
    </div>
        <!--하나의창-->
        <div class="card">
            <div>
                <strong id="name"><a href="">course입니다아</a></strong>
            </div>
            <div class="name_card">
                <img  class="" src="" width="45px" height="45px">
                <strong id="name">닉네임닉네임닏네임</strong>
            </div>
        </div>
            <!--하나의창-->
    <div class="card">
            <div>
                <strong id="name"><a href="">course입니다아</a></strong>
            </div>
            <div class="name_card">
                <img  class="" src="" width="45px" height="45px">
                <strong id="name">닉네임닉네임닏네임</strong>
            </div>
        </div>
    
</td>
</tr>
        <tr>
    <tr>
            <td height="135"></td>
    </tr>
    </table>
</body>
</html>