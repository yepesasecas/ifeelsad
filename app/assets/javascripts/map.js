var map;
AmCharts.ready(function() {
  // create AmMap object
  map = new AmCharts.AmMap();
  // set path to images
  map.pathToImages = "http://www.amcharts.com/lib/3/images/";
  map.imagesSettings.balloonText = "<span style='font-size:14px;'><b>[[title]]</b>: [[value]]</span>";
  /* create data provider object
   map property is usually the same as the name of the map file.

   getAreasFromMap indicates that amMap should read all the areas available
   in the map data and treat them as they are included in your data provider.
   in case you don't set it to true, all the areas except listed in data
   provider will be treated as unlisted.
  */
  var dataProvider = {
      map: "worldLow",
      images:[] 
  }; 
  // pass data provider to the map object
  map.dataProvider = dataProvider;

  /* create areas settings
   * autoZoom set to true means that the map will zoom-in when clicked on the area
   * selectedColor indicates color of the clicked area.
   */
  map.areasSettings = {
      autoZoom:      true,
      selectedColor: "#DDDDDD",
      balloonText:   "<span style='font-size:14px;'><b>[[title]]</b>: [[value]]</span>"
  };

  // write the map to container div
  map.write("mapdiv");
});

function loadData(){
  $.getJSON("/feelings", function(response){
    filterData(response);
  });
}

function filterData(data){
  MAX_BUBBLE = 50;
  MIN_BUBBLE = 6;
  newData    = data;
  max        = null;
  maxValue   = 0;

  // SET MAX VALUE
  for(var i = 0; i < newData.images.length; i++){
    value = newData.images[i].value;
    if(maxValue < value){
      maxValue = value;
    }
  }
  console.log("max_value: " + maxValue);

  //GET NEW VALUES 
  for(var i = 0; i < newData.images.length; i++){
    image    = newData.images[i];
    value    = image.value;
    newValue = (value * MAX_BUBBLE) / maxValue;
    // VALIDATE MIN BUBBLE
    if(newValue < MIN_BUBBLE){
      newValue = MIN_BUBBLE;
    }
    // SET NEW VALUE
    image.value  = newValue;
    image.width  = newValue;
    image.height = newValue;
  }
  console.log(newData);
  setData(newData);
}

function setData(data){
  map.dataProvider = data;
  map.validateNow();
}