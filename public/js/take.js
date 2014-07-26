$(function(){

	$('a').on('click', function(event){
		event.preventDefault();

		var url = $(this).attr('href');

		$.get(url, function(data){
			$('.all-surveys').after(data);
			$('.all-surveys').remove();
		}, "html")

		// $.post(url, answer, function(data){
		// 	$('.show').remove();
		// 	console.log(data);
		// 	$('center').append(data);
		// }, 'html');

	});

});