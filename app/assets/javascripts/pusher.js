var pusher  = new Pusher('23323091d73f37df0d95');
var channel = pusher.subscribe('visitors');

var setSads = function(sads){
  $("#sads").html(sads);
};

channel.bind('new_feeling', function(data) {
  console.log(data.message);
  console.log(data.sads);
  setSads(data.sads);
  loadData();
});