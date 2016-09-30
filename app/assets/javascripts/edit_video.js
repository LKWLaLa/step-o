$(".videos").ready(function(){
  newStepListener();
  existingStepListener();
  cancelListener();
  deleteTimemarkerListener();
});

function newStepListener(){
  $('div.dropdown').on('click', 'a#add_new', function(event){
    $('div.step_dropdown').css("display", "none");
    $('input.timestamp').val("");
    $('select').val("");
    $('div.new_step_fields_group').slideDown();
    $('div.timestamp_field').slideDown();
    $('a#cancel').show();
    event.preventDefault(); //prevent page from scrolling to top on refresh
  })
}

function existingStepListener(){
  $('div.dropdown').on('click', 'a#from_library', function(event){
    $('div.new_step_fields_group').css("display", "none");
    $('input.timestamp').val("");
    $('input.name_field').val("");
    $('input.lom_field').val("");
    $('div.step_dropdown').slideDown();
    $('div.timestamp_field').slideDown();
     $('a#cancel').show();
    event.preventDefault();//prevent page from scrolling to top on refresh
  })
}

function cancelListener(){
  $('a#cancel').on('click', function(event){
    $('div.new_step_fields_group').slideUp();
    $('div.step_dropdown').slideUp();
    $('div.timestamp_field').slideUp();
    $('input.timestamp').val("");
    $('input.name_field').val("");
    $('input.lom_field').val("");
    $('select').val("");
     $('a#cancel').hide();
    event.preventDefault();//prevent page from scrolling to top on refresh
  })
}

function deleteTimemarkerListener(){
  $('ul.list-group.timemarkers').on('click', 'span.x', function(event){
    var markerId = $(event.target).parent().data().id;

     if (confirm("Are you sure you want to remove this step/timestamp from this video?")) {

           $.ajax({
            url: 'https://step-o.herokuapp.com/timemarkers/' + markerId,
            method: 'DELETE'
            }).done(function(data) {
              $('[data-id=' + markerId + ']').remove();
           });    
      }
     event.preventDefault()   
  });
 }