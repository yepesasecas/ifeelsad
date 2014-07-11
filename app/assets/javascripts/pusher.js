var pusher  = new Pusher('23323091d73f37df0d95');
var channel = pusher.subscribe('visitors');

channel.bind('new_feeling', function(data) {
  setSads(data.sads);
  alertify.log(data["last_feeling"]["message"], "", 0);
  loadData();
});

var setSads = function(sads){
  $("#sads").html(sads);
};