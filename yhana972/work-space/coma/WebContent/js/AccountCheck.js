
function AccountCheck() {
	var frm = document.AccountForm;
	var str = "";
	// 비밀번호가 확인에 빈칸이 아니면
	if (frm.u_pass.value != "" && frm.u_Repwd.value != ""
			&& frm.u_Repwd_check.value != "") {
		// 새비밀번호 길이 확인
		if (frm.u_Repwd.value.length < 4 || frm.u_Repwd.value.length > 16) {
			window.alert("비밀번호는 4자 이상에서 16자 이하여야합니다. 다시 입력해주세요.");
			return false;
		}
		// 새비밀번호랑 새비밀번호 확인이 같지 않다면
		if (frm.u_Repwd.value != frm.u_Repwd_check.value) {
			window.alert("입력하신 새 비밀번호와 새 비밀번호 확인이 맞지 않습니다. 다시 입력해주세요.");
			return false;
		}
		return true;
	}
	return true;
}