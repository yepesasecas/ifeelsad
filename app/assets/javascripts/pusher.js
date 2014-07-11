var pusher  = new Pusher('23323091d73f37df0d95');
var channel = pusher.subscribe('visitors');

channel.bind('new_feeling', function(data) {
  setSads(data.sads);
  loadData();
  alertify.log(data.sads + "People sad.");
});

var setSads = function(sads){
  $("#sads").html(sads);
};