/**
 *  회원가입 
 */
function sendit() {
	if(frm.u_nickname.value == ""){
		alert("닉네임을 입력해 주세요")
		frm.u_nickname.focus()
		return false
	}
	if(frm.u_email.value == ""){
		alert("이메일을 입력해 주세요")
		frm.u_email.focus()
		return false
	}
	if(frm.u_pass.value == ""){
		alert("비밀번호를 입력해 주세요")
		frm.u_pass.focus()
		return false
	}
	frm.submit()
}