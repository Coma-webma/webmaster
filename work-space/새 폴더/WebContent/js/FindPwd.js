/**
 * 
 */
/**
 * 
 */
function checkEmail(){
	var frm = document.FindPwdForm;
	var str="";	
	
	$("#check_email").css("display","none");
	
	//빈칸인지 확인
	if(frm.email.value==""){
		$(".check").css("display","block");
		if(frm.email.value==""){
			$("#check_email").css("display","block");
			document.getElementById("check_email").innerHTML = "이메일을 입력해주세요.";
		}
		return false;
	}else{
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
