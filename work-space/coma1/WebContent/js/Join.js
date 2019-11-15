/**
 * 
 */
function checkNull(){
	var frm = document.JoinForm;
	var str="";	
	
	$("#check_nickname").css("display","none");
	$("#check_email").css("display","none");
	$("#check_pwd").css("display","none");
	$("#check_Repwd").css("display","none");
	
	//빈칸인지 확인
	if(frm.nickname.value==""||frm.email.value==""||frm.pwd.value==""||frm.Repwd.value==""){
		$(".check").css("display","block");
		if(frm.nickname.value==""){
			$("#check_nickname").css("display","block");
			document.getElementById("check_nickname").innerHTML = "닉네임을 입력해주세요.";
		}
		if(frm.email.value==""){
			$("#check_email").css("display","block");
			document.getElementById("check_email").innerHTML = "이메일을 입력해주세요.";
		}
		if(frm.pwd.value==""){	
			$("#check_pwd").css("display","block");
			document.getElementById("check_pwd").innerHTML = "비밀번호를 입력해주세요.";
		}
		if(frm.Repwd.value==""){
			$("#check_Repwd").css("display","block");
			document.getElementById("check_Repwd").innerHTML = "비밀번호 확인을 입력해주세요.";
		}
		return false;
	}else{
		//비밀번호랑 비밀번호 확인이 같지 않다면 
		if(frm.pwd.value!=frm.Repwd.value){
			$(".check").css("display","block");
			$("#check_pwd").css("display","block");
			document.getElementById("check_pwd").innerHTML = "입력하신 비밀번호와 비밀번호 확인이 맞지 않습니다.다시 입력해주세요.";
			return false;
		}
		//비밀번호 길이 확인
		if(frm.pwd.value.length < 4 || frm.pwd.value.length > 16){
			$(".check").css("display","block");
			$("#check_pwd").css("display","block");
			document.getElementById("check_pwd").innerHTML = "패스워드는 4자이상 16자 이하로 입력해 주세요.";
			return false;
		}
		//이메일 정규식 확인
		var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    if (regExp.test(frm.email.value)==false){
	    	$(".check").css("display","block");
			$("#check_email").css("display","block");
			document.getElementById("check_email").innerHTML = "이메일 형식으로 입력해주세요.";
			return false;
	    }
		frm.sendit();
		return true;
	}
}
