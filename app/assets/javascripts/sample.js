$(".sessions.new").ready(function(){
  populateSampleLogin();
});

function populateSampleLogin(){
  $("#sample").click(function() {
    $("#email").val("test@example.com");
    $("#password").val("ii8gtstest");
  })
};