$(function(){

	$('.survey-form').on('submit', function(event){
		event.preventDefault();

		var url = $('form').attr('action');
		var checked = $("input[type='radio'][name='answer']:checked").val();

		var answer = {answer_id: checked};
		console.log(answer);

		$.post(url, answer, function(data){
			$('.show').remove();
			console.log(data);
			$('center').append(data);
		}, 'html');

	});

});

