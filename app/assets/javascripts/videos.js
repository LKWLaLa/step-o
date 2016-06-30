var indexContent = '';
var user = '';
var videoId = '';

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
    $('li div.panel').each(function(index, body){
      if ($(this).find('.panel-body').data().id === videoId){
        indexContent = $(this).find('.panel-body').html();
        getVideoAttributes();
        $(this).find('.panel-body').html(Video.template);
        $(this).find('.trigger').attr("class","revert pull-right").text("Close");
       };;
    });
  });
}

function getVideoAttributes(){
  showPage = $.ajax({
    url: 'http://localhost:3000/users/' + user + '/videos/' + videoId,
    method: 'GET',
   dataType: 'json'
  });

 showPage.done(function(data){
  console.log(data);
  });
};

function videoCloseListener(){
  $('li').on('click', '.revert', function(event){
     videoId = $(event.target).data();
    $('li div.panel').each(function(index, body){
      if ($(this).find('.panel-body').data().id === videoId.id){
        $(this).find('.panel-body').html(indexContent);
        $(this).find('.revert').attr("class","trigger pull-right").text("Show");
       };;
    });
  });
}






