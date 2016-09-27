$(".steps.edit").ready(function(){
  newVideoListener();
  existingVideoListener();
  cancelListener();
});

function newVideoListener(){
  $('div.dropdown').on('click', 'a#add_new', function(event){
     $('div.video_dropdown').css("display", "none");
    $('div.new_video_fields_group').slideDown();
    $('div.timestamp_field').slideDown();
    event.preventDefault(); //prevent page from scrolling to top on refresh
  })
}

function existingVideoListener(){
  $('div.dropdown').on('click', 'a#from_library', function(event){
    $('div.new_video_fields_group').css("display", "none");
    $('div.video_dropdown').slideDown();
    $('div.timestamp_field').slideDown();
    event.preventDefault();//prevent page from scrolling to top on refresh
  })
}

function cancelListener(){
  $('a#cancel').on('click', function(event){
    $('div.new_video_fields_group').slideUp();
    $('div.video_dropdown').slideUp();
    $('div.timestamp_field').slideUp();
    event.preventDefault();//prevent page from scrolling to top on refresh
  })
}