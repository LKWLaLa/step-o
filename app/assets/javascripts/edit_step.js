$(".steps").ready(function(){
  newVideoListener();
  existingVideoListener();
  cancelListener();
  deleteTimemarkerListener();
});

function newVideoListener(){
  $('div.dropdown').on('click', 'a#add_new', function(event){
    $('div.video_dropdown').css("display", "none");
    $('input.timestamp').val("");
    $('select').val("");
    $('div.new_video_fields_group').slideDown();
    $('div.timestamp_field').slideDown();
    $('a#cancel').show();
    event.preventDefault(); //prevent page from scrolling to top on refresh
  })
}

function existingVideoListener(){
  $('div.dropdown').on('click', 'a#from_library', function(event){
    $('div.new_video_fields_group').css("display", "none");
    $('input.timestamp').val("");
    $('input.year_field').val("");
    $('input.title_field').val("");
    $('input.url_field').val("");
    $('div.video_dropdown').slideDown();
    $('div.timestamp_field').slideDown();
     $('a#cancel').show();
    event.preventDefault();//prevent page from scrolling to top on refresh
  })
}

function cancelListener(){
  $('a#cancel').on('click', function(event){
    $('div.new_video_fields_group').slideUp();
    $('div.video_dropdown').slideUp();
    $('div.timestamp_field').slideUp();
    $('input.timestamp').val("");
    $('input.year_field').val("");
    $('input.title_field').val("");
    $('input.url_field').val("");
    $('select').val("");
     $('a#cancel').hide();
    event.preventDefault();//prevent page from scrolling to top on refresh
  })
}

function deleteTimemarkerListener(){
  $('ul.list-group.timemarkers').on('click', 'span.x', function(event){
    var markerId = $(event.target).parent().data().id;

     if (confirm("Are you sure you want to remove this video/timestamp from this step?")) {

           $.ajax({
            url: 'http://localhost:3000/timemarkers/' + markerId,
            method: 'DELETE'
            }).done(function(data) {
              $('[data-id=' + markerId + ']').remove();
           });    
      }
     event.preventDefault()   
  });
 }