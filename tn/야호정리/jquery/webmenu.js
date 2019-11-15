$(function () {
	$("#a").on("click", function () {
		$('li#a').addClass('selected');
		$('li#b').removeClass('selected');
		$('li#c').removeClass('selected');
		$("div#mycontent_submenu").css("display", "block");
		$("div#act_submenu").css("display", "none");
		$("div#niName_submenu").css("display", "none");
		return false;
	});
	$("#b").on("click", function () {
		$('li#b').addClass('selected');
		$('li#a').removeClass('selected');
		$('li#c').removeClass('selected');
		$("div#act_submenu").css("display", "block");
		$("div#niName_submenu").css("display", "none");
		$("div#mycontent_submenu").css("display", "none");
		return false;
	});
	$("#c").on("click", function () {
		$('li#c').addClass('selected');
		$('li#a').removeClass('selected');
		$('li#b').removeClass('selected');
		$("div#niName_submenu").css("display", "block");
		$("div#mycontent_submenu").css("display", "none");
		$("div#act_submenu").css("display", "none");
		return false;
	});
	$('html').click(function () {
		$('li#c').removeClass('selected');
		$('li#a').removeClass('selected');
		$('li#b').removeClass('selected');
		$("div#mycontent_submenu").css("display", "none");
		$("div#act_submenu").css("display", "none");
		$("div#niName_submenu").css("display", "none");
	});
	/*코스 전체 목록 */
	$("#course_allview").on("click", function () {
		$('li#course_allview').addClass('selected');
		$('li#a').removeClass('selected');
		$('li#b').removeClass('selected');
		$('li#c').removeClass('selected');
		$("div#all_menus").css("display", "block");
		$("div#niName_submenu").css("display", "none");
		$("div#mycontent_submenu").css("display", "none");
		$("div#act_submenu").css("display", "none");
		return false;
	});	/*코스 전체 목록 닫기 */
	$(".btn_close").on("click", function () {
		$('li#course_allview').removeClass('selected');
		$("div#all_menus").css("display", "none");
	});
	// 코스 1-1 하위메뉴 나오게하기
	$(function () {
		$("li#course1-1").on({
			mouseenter: function () {
				$("div#1").css("display", "block");
			},
			mouseleave: function () {
				$("div#1").css("display", "none");
			}
		});
	});
});
// 신고하기 팝업
function popup(url, w, h, name, option) {
	var pozX, pozY;
	var sw = screen.availWidth;
	var sh = screen.availHeight;
	var scroll = 0;
	if (option == 'scroll') {
		scroll = 1;
	}
	pozX = (sw - w) / 2;
	pozY = (sh - h) / 2;
	window.open(url, name, "location=0,status=0,scrollbars=" + scroll + ",resizable=1,width=" + w + ",height=" + h +
		",left=" + pozX + ",top=" + pozY);
}

// 공동공부 팝업
$(function () {
	$(".dir_main_img").on("click", function () {
		$("#popup_together").css("display", "block");
	});
});
$(function () {
	$(".close").on("click", function () {
		$("#popup_together").css("display", "none");
	});
});
//모듈 연결
$(function () {
	$( "a.module").on("click", function () {
		$("#module_popup").css("display","block");
	});
});
$(function () {
	$(".close").on("click", function () {
		$("#module_popup").css("display", "none");
	});
});
//봤어요 취소 
$(function () {
	$("a.marking2").click(function () {
		$("span.action").text("봤어요 취소");
		$("a.marking2").addClass("cancel");
	});

});
