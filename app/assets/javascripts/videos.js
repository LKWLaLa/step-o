
var user = '';



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
  user = $('.container#videos_index').data().userId;
  videoOpenListener();
  videoCloseListener();
});



function videoOpenListener(){
  $('li').on('click', '.trigger', function(event){
    videoId = $(event.target).data().id;

    $.ajax({
      url: 'http://localhost:3000/users/' + user + '/videos/' + videoId,
      method: 'GET',
      dataType: 'json'

     }).done(function(data){
          var videoObject = new Video(data);
          var replacementHTML = Video.template(videoObject);

          $('li div.panel').each(function(index, body){
            if ($(this).find('.panel-body').data().id === videoId){
              var indexHTML = $(this).find('.panel-body').html();
              $(this).find('.panel-body').html(replacementHTML);
              $(this).data( 'old_html', indexHTML );
              $(this).find('.trigger').attr("class","revert pull-right").text("Close");
              $(this).find('iframe').attr("src", "http://www.youtube.com/embed/" + YouTubeGetID(videoObject.url));
            };
         });      
      });
    });
  }
 


function videoCloseListener(){
  $('li').on('click', '.revert', function(event){
     videoId = $(event.target).data();
    $('li div.panel').each(function(index, body){
      if ($(this).find('.panel-body').data().id === videoId.id){
        $(this).find('.panel-body').html($(this).data().old_html);
        $(this).find('.revert').attr("class","trigger pull-right").text("Show");
       };;
    });
  });
}

function YouTubeGetID(url){
  var ID = '';
  url = url.replace(/(>|<)/gi,'').split(/(vi\/|v=|\/v\/|youtu\.be\/|\/embed\/)/);
  if(url[2] !== undefined) {
    ID = url[2].split(/[^0-9a-z_\-]/i);
    ID = ID[0];
  }
  else {
    ID = url;
  }
    return ID;
}






