/**
 * 코스저장 js
 */
function sendit(){
   var frm = document.boardtopicForm
   if(frm.t_title.value == ""){
      alert("제목을 입력해 주세요")
      frm.t_title.focus()
      return false
   }else{
	   return true;
   }
   
   if(frm.t_content.value == ""){
      alert("내용을 입력해 주세요")
      frm.t_content.focus()
      return false
   }else{
	   return true;
   }
   	
}