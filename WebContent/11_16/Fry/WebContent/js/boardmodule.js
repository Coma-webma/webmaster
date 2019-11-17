/**
 * 모듈 js
 */
function sendit(){
   var frm = document.boardmoduleForm
   if(frm.m_title.value == ""){
      alert("제목을 입력해 주세요")
      frm.m_title.focus()
      return false
   }else{
	   return true;
   }
   
   if(frm.m_content.value == ""){
      alert("내용을 입력해 주세요")
      frm.m_content.focus()
      return false
   }else{
	   return true;
   }

   
   /*
   if(frm.m_together_title.value == ""){
      alert("공동공부 제목을 입력하세요.")
      frm.m_together_title.focus()
      return false
   }else{
	   return true;
   }
   
   if(frm.m_view_title.value == ""){
      alert("봤어요 타이틀을 입력하세요.")
      frm.m_view_title.focus()
      return false
   }else{
	   return true;
   }
   	*/
}