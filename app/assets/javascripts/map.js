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
      autoZoom: true,
      selectedColor: "#CC0000"
  };

  // write the map to container div
  map.write("mapdiv");
});

function loadData(){
  $.getJSON("/feelings", function(response){
    setData(response);
  });
}

function setData(data){
  map.dataProvider = data;
  map.validateNow();
}