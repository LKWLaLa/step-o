function Style(attributes){
  this.id = attributes.id;
  this.name = attributes.name;
} 

$(function(){
  addStyleListener();

});

function addStyleListener(){
  $("#style_button").click(function() {
    var newStyle = $("#style_input").val();
    //CSRF Addition
    var token = $("authenticity_token").val();
    //End CSRF Addition
    debugger;

    $.ajax({
    url: 'http://localhost:3000/styles',
    method: 'POST',
    data: {
      name: newStyle,
      //CSRF Addition
      authenticity_token: token
      //CSRF Chad Addition
    }
  }).done(function(data) {
      debugger;
      console.log(data);
    });  

  });
 }