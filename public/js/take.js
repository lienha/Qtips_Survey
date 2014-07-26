$(function(){

	$('.container').on('click', 'a', function(event){
		event.preventDefault();

		var url = $(this).attr('href');

		$.get(url, function(data){
			$('.all-surveys').after(data);
			$('.all-surveys').remove();
		}, "html")


	});

});