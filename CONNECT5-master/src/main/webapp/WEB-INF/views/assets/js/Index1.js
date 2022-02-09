$(function() {
	$(window).scroll(function() { // 브라우저에 스크롤이 발생하는 순간부터
		var curpos = $(window).scrollTop(); // 스크롤바의 상단 위치값+20 보관
		$("#sidebar_menu").stop().animate({
			"top" : curpos
		}); // 스카이메뉴의 상단위치값 애니
	});
});