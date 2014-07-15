var last_messages = function(){

  var delay = function(){
    var number = Math.floor(Math.random() * 8) + 1;
    return number * 1000;
  };

  $.getJSON("/feelings", function(r){
    var feelings = r.last;
    var i        = 0;

    var show_last_messages = function() {
      setTimeout(function () {
        if(i < feelings.length){
          alertify.log(feelings[i].message);
          i++;
          show_last_messages();
        }
      }, delay());
    };
    show_last_messages();
  });
};
