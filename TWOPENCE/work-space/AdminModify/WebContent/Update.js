//로그인 시도한 유저 정보 확인
function userCheck(){
	var frm = document.UpdateForm;
	var str="";	
	//빈칸인지 확인
	if(frm.email.value==""||frm.pwd.value==""){
		/*로그인 시 아이디와 비밀번호 잘못 입력 시 뜨는 다이얼로그창*/
		 $(".fail_login").css("display","block");
		return false;
	}else{
		return true;
	}
}