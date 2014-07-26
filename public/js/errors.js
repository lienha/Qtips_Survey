$(function(){

  $('[name="sign_up"]').submit( function(event) {
    var email = event.target.email.value;
    var password = event.target.password.value;
    if ((email.match(/^.+[@].+[.].+/) === null) || (password.match(/^\w{8,}/) === null) || (password.match(/[A-Z]/) === null) || (password.match(/[0-9]/) === null)){
      event.preventDefault();
      $("#errors").remove();
      $("h1").after("<ul id='errors'>");
      if (email.match(/^.+[@].+[.].+/) === null){
        $("#errors").append("<li>Must be a valid email address</li>");
      }
      if (password.match(/^\w{8,}/) === null){
        $("#errors").append("<li>Password must be at least 8 characters long</li>");
      }
      if (password.match(/[A-Z]/) === null){
        $("#errors").append("<li>Password must have at least one capital letter</li>");
      }
      if (password.match(/[0-9]/) === null){
        $("#errors").append("<li>Password must have at least one numeric character (0-9)</li>");
      }
    }
  });
});