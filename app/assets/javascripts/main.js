// START DOCUMENT
$(document).foundation();



// EFFECT ANIMATION
$(window).scroll(function () {
	var y = $(window).scrollTop(),

	x = $('.animated').offset().top - 450;

	if (y > x) {
		$('.effect-1').addClass('slideInLeft').removeClass('slideOutLeft');
		
	} else {
		$('.effect-1').removeClass('slideInLeft').addClass('slideOutLeft');
	};
});