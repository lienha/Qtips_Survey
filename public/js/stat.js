$(function() {
	$('.s-stats' ).on('mouseenter', '.graphs', function(){
		$(this).parent().parent().css("font-weight", "bold");
		var surID = $(this).parent().parent().attr('id');
		var divID = surID + "-tt";
		$('body').find('#' + divID).css('visibility', 'visible');
	});
	$('.s-stats' ).on('mouseleave', '.graphs', function(){
		$(this).parent().parent().css("font-weight", "normal");
		var surID = $(this).parent().parent().attr('id');
		var divID = surID + "-tt";
		$('body').find('#' + divID).css('visibility', 'hidden');
	});
});	