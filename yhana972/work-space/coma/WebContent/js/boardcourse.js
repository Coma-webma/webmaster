/**
 * 코스저장 js
 */
function sendit(){
   var frm = document.boardcourseForm;
   if(frm.c_title.value == ""){
      alert("제목을 입력해 주세요")
      frm.c_title.focus()
      return false;
   }else{
	   return true;
   }
   
   if(frm.c_content.value == ""){
      alert("내용을 입력해 주세요");
      frm.c_content.focus()
      return false;
   }else{
	   return true;
   }
   	
}

function Del(c_idx) {
	location.href="Del.jsp?c_idx="+ c_idx;
}