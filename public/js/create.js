$(function(){
  $('#add-question').on('click', function(event) {
    event.preventDefault();
    $('.questions > ol').append('<li class="q">Question:&nbsp;<input type="text" name=""> <button class="remove-question" type="button">-</button><p>Choices:&nbsp;&nbsp;<button class="add-choice" type="button">+</button></p><ol class="choices" type="A"><li><input type="text" name=""> <button class="remove-choice" type="button">-</button></li><li><input type="text" name=""> <button class="remove-choice" type="button">-</button></li><li><input type="text" name=""> <button class="remove-choice" type="button">-</button></li><li><input type="text" name=""> <button class="remove-choice" type="button">-</button></li></ol></li>');
  });

  $('.questions').on('click', '.remove-question', function(event) {
    event.preventDefault();
    $(this).parent().remove();
  });

  $('.questions').on('click', '.add-choice', function(event) {
    event.preventDefault();
    $(this).parent().parent().find('.choices').append('<li><input type="text"> <button class="remove-choice" type="button">-</button></li>');
  });   

  $('.questions').on('click', '.remove-choice', function(event) {
    event.preventDefault();
    $(this).parent().remove();
  });  

  $('form[name="new-survey"]').on('submit', function(event) {
    event.preventDefault();
    // Loop through each question
    var title = $('input[name="title"]').val();
    var questions = [];
    var answers = [];


    var $allQuestions = $('.questions > ol').find('.q');
    for (var i = 0; i < $allQuestions.length; i++) {
      var $currQues = $allQuestions.eq(i);
      questions.push($currQues.children().first().val());
      var $allChoices = $currQues.find('.choices').find('li');
      answers.push([]);
      for (var j = 0; j < $allChoices.length; j++) {
        var $currAns = $allChoices.eq(j);
        answers[i].push($currAns.children().first().val());
      }
    }

    $.ajax({
      url: "/create",
      type: "POST",
      data: {title: title, questions: questions, answers: answers},
      success: function(data) {
        if (data.message) {
          alert("Successfully added " + title + " survey!");
        } else {
          alert("Failed to add " + title + " survey!");
        }
        window.location.href = window.location.origin;
      },
      dataType: "json"
    });
  });



});