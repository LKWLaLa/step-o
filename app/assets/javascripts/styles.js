function Style(attributes){
  this.id = attributes.id;
  this.name = attributes.name;
} 

Style.prototype.template = function(){
   var template = '<li class="label label-success checkbox-inline no_indent"';
   template += 'data-id="'+ this.id + '">' + this.name + '</li>';
   template += '<span id="style_delete" data-id="' + this.id + '">x</span><br>';
   template += '<br style="display:none;"><div class="well row" style="display: none;">';
   return template;
};



$(function(){
  addStyleListener();
  deleteStyleListener();
  showStepsListener();
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
     $('#styles_list').prepend(style.template());
     $('#style_input').val(''); 
    }); 
  });
 }

 function deleteStyleListener(){
  $('div#styles_list').on('click', 'span#style_delete', function(event){
    var styleId = $(event.target).data().id;

     if (confirm("Are you sure you want to delete this style?")) {

           $.ajax({
            url: 'http://localhost:3000/styles/' + styleId,
            method: 'DELETE'
            }).done(function(data) {
              $('[data-id=' + styleId + ']').next('br').remove();
              $('[data-id=' + styleId + ']').next('br').remove();
              $('[data-id=' + styleId + ']').nextAll('.well:first').remove();
              $('[data-id=' + styleId + ']').remove();
           });    
      }
      return false;    
  });
 }

 function showStepsListener(){
  $('div#styles_list').on('click', 'li.label', function(event){
    $(event.target).nextAll('.well:first').toggle().prev('br').toggle();
  })
 }