/**
 * 회원가입에 필요한 JS
 */
function sendit(){
   var frm = document.regForm
   if(frm.u_email.value == ""){
      alert("아이디를 입력해 주세요")
      frm.m_userid.focus()
      return false
   }
   
   if(frm.u_nickname.value == ""){
      alert("닉네임을 입력해 주세요")
      frm.m_name.focus()
      return false
   }
   frm.submit()
}

function del(){

   var frm = document.delform
   
   if(frm.u_nickname.value == ""){
      alert("닉네임을 입력해 주세요")
      frm.m_name.focus()
      return false
   }
   frm.submit()
}
   