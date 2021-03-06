
var user = '';


$(".videos.index").ready(function(){  
  user = $('.container#videos_index').data().userId;
  addTemplateToVideo();
  videoOpenListener();
  videoCloseListener();
 });


function Video(attributes){
  this.id = attributes.id;
  this.title = attributes.title;
  this.notes = attributes.notes;
  this.url = attributes.url;
  this.user_id = attributes.user_id; 
  this.styles = attributes.styles;
  this.timemarkers = attributes.timemarkers;  
} 

  function addTemplateToVideo(){
    Video.templateSource = $("#video-template").html();
    Video.template = Handlebars.compile(Video.templateSource);
  }


  Video.prototype.renderDropdown = function(){
    return Video.template(this);
  }



  function videoOpenListener(){
    $('li').on('click', '.trigger', function(event){
    var videoId = $(event.target).data().id;

    $.ajax({
      url: 'https://step-o.herokuapp.com/users/' + user + '/videos/' + videoId,
      method: 'GET',
      dataType: 'json'

     }).done(function(data){
          var videoObject = new Video(data);

          $('li div.panel').each(function(index, body){
            if ($(this).find('.panel-body').data().id === videoId){              
              var indexHTML = $(this).find('.panel-body').html();

              $(this).find('.panel-body').hide();
              $(this).find('.panel-body').html(videoObject.renderDropdown());
              $(this).find('.panel-body').slideDown();

              $(this).data( 'old_html', indexHTML );
              $(this).find('.trigger').attr("class","revert pull-right btn btn-primary").text("Close");
              $(this).find('iframe').attr("src", "https://www.youtube.com/embed/" + YouTubeGetID(videoObject.url));
            };
         });      
      });
    });
  }
 


  function videoCloseListener(){
    $('li').on('click', '.revert', function(event){
       var videoId = $(event.target).data().id;

      $('li div.panel').each(function(index, body){      
        if ($(this).find('.panel-body').data().id === videoId){
          $(this).find('.panel-body').html($(this).data().old_html);
          $(this).find('.revert').attr("class","trigger pull-right btn btn-primary").text("Show");
         };;
      });
    });
  }


// YouTubeGetID function found at:  https://gist.github.com/takien/4077195

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






