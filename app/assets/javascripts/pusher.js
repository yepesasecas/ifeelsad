var pusher  = new Pusher('23323091d73f37df0d95');
var channel = pusher.subscribe('visitors');

channel.bind('new_feeling', function(data) {
  message = data["last_feeling"]["message"];
  if(message != null && message != "" && message != " "){
    alertify.log(message, "", 0);
  }
  setSads(data.sads);
  loadData();
});

var setSads = function(sads){
  $("#sads").html(sads);
};