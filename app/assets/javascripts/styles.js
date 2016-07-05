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
    
    var token = $("authenticity_token").val();
   

    $.ajax({
    url: 'http://localhost:3000/styles',
    method: 'POST',
    data: {
      name: newStyle,     
      authenticity_token: token    
    }
  }).done(function(data) {
     style = new Style(data);
     $('#styles_list').prepend('<li class="label label-success checkbox-inline no_indent">' + style.name + '</li><span>x</span><br>');
    });  

  });
 }