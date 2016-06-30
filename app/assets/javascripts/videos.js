
function Video(attributes){
  this.id = attributes.id;
  this.title = attributes.title;
  this.notes = attributes.notes;
  this.url = attributes.url;
  this.user_id = attributes.user_id;  
} 

$(function(){
  Video.templateSource = $("#video-template").html();
  Video.template = Handlebars.compile(Video.templateSource);
  videoListener();
});

function videoListener(){
  $('button').on('click', '#trigger', function(event){
    var data = $(event.target).data();
    $("div.panel-body[data='" + data +"']").html(Video.template);
  });
}