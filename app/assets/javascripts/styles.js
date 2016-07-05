function Style(attributes){
  this.id = attributes.id;
  this.name = attributes.name;
} 

$(function(){
  addStyleListener();
  deleteStyleListener();
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
     $('#styles_list').prepend('<li class="label label-success checkbox-inline no_indent" data-id="'+ style.id + '">' + style.name + '</li><span id="style_delete" data-id="' + style.id + '">x</span><br>');
    }); 
  });
 }

 function deleteStyleListener(){
  $('span#style_delete').click(function(event){
    var styleId = $(event.target).data().id;

     if (confirm("Are you sure you want to delete this style?")) {

           $.ajax({
            url: 'http://localhost:3000/styles/' + styleId,
            method: 'DELETE'
            }).done(function(data) {
              $('[data-id=' + styleId + ']').next('br').remove();
              $('[data-id=' + styleId + ']').remove();
           });    
      }
      return false;    
  });
 }