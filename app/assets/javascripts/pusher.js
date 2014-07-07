var pusher  = new Pusher('23323091d73f37df0d95');
var channel = pusher.subscribe('test_channel');

var setSads = function(sads){
  $("#sads").html(sads);
};

channel.bind('my_event', function(data) {
  console.log(data.message);
  console.log(data.sads);
  setSads(data.sads);
});