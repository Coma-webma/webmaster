/*로그인 시 아이디와 비밀번호 잘못 입력 시 뜨는 다이얼로그창*/
$(function(){
    $(".btn").on("click",function(){
        $(".fail_login").css("display","block");
    });
});