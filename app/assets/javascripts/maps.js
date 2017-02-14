$(document).ready(function(){
  require([
      "esri/Map",
      "esri/views/MapView",
      "esri/layers/MapImageLayer",
      "dojo/domReady!"
    ], function(Map, MapView, MapImageLayer) {

      var createLayer = function(layer) {
        return new MapImageLayer({
          url: layer
        })
      }

      var fires = "https://wildfire.cr.usgs.gov/ArcGIS/rest/services/geomac_dyn/MapServer";
      var rivers = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Observations/ahps_riv_gauges/MapServer";
      var hazards = "https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer";
      var earthquakes = "http://sampleserver3.arcgisonline.com/ArcGIS/rest/services/Earthquakes/EarthquakesFromLastSevenDays/MapServer";
      var tsunami = "http://maps.gdc.govt.nz/arcgis/rest/services/Open_Data/GDC_hazard_geological/MapServer";
      var geospatial = "https://igems.doi.gov/arcgis/rest/services/igems_haz/MapServer";
      var layers = [
        {earthquakes: createLayer(earthquakes)},
        {fires: createLayer(fires)} , {rivers: createLayer(rivers)},
        {hazards: createLayer(hazards)}, {tsunami: createLayer(tsunami)},
        {geospatial: createLayer(geospatial)}
      ];

      layers.forEach(function(layer){

        var map = new Map({
          basemap: "streets-relief-vector",
          layers: Object.values(layer)
        });

        var view = new MapView({
          container: Object.keys(layer)[0],
          map: map,
          zoom: 5,
          center: [-122.4194, 37.774]
        }).then(function(){
          // console.log("success");
        }, function(error){
          console.log(error);
        });

      });


  });
});
