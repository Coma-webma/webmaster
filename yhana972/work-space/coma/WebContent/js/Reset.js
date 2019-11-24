function CheckPwd(){
	var frm = document.ResetForm;
	var str="";	
	
	$("#check_pwd").css("display","none");
	
	//빈칸인지 확인
	if(frm.u_pwd.value==""||frm.Repwd.value==""){
		$(".check").css("display","block");
		$("#check_pwd").css("display","block");
		document.getElementById("check_pwd").innerHTML = "빈 칸을 입력해주세요.";
		return false;
	}else{
		//입력한 비밀번호와 비밀번호 확인이 같은지 확인
		if(frm.u_pwd.value!=frm.Repwd.value){
			$(".check").css("display","block");
			$("#check_pwd").css("display","block");
			document.getElementById("check_pwd").innerHTML = "두 개의 항목이 같지 않습니다.(비밀번호 확인, 비밀번호)";
			return false;
		}else{
			return true;
		}
	}
}