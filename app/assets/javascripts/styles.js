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
    debugger;

    posting = $.ajax({
    url: '/styles',
    method: 'POST',
    data: {
      name: newStyle
    }
  });

    posting.success(function(data) {
      debugger;
      console.log(data);
    });  

  });
 }