
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
  $('li').on('click', '.trigger', function(event){
    var videoId = $(event.target).data();
    $('li div.panel-body').each(function(index, body){
      if ($(this).data().id === videoId.id){
        $(this).html(Video.template);
       };
    });
  
  });
}