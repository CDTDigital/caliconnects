var loadMap = function loadMap(url, containerId) {
    require([
        "esri/Map",
        "esri/views/MapView",
        "esri/layers/MapImageLayer",
        "dojo/domReady!"
    ], function (Map, MapView, MapImageLayer) {
        var layer = new MapImageLayer({
            url: url
        });

        var map = new Map({
            basemap: "streets-relief-vector",
            layers: [layer]
        });

        console.log("maps", map);

        var view = new MapView({
            container: containerId,
            map: map,
            zoom: 5,
            center: [-122.4194, 37.774]
        }).then(function () {
                console.log("complete");
            }, function(error){
                console.log("error:", error);
            }
        );
    });
};


$(document).ready(function(){
    if ($("#fire-data").length > 0){
       var fire_url = $("#fire-url").text();

       fire_list = "";

       $.get(fire_url, function(data){
           data.forEach(function(fire_event){
               var title = "<td>" + fire_event["title"] + "</td>";
               var timestamp = "<td>" + fire_event["pubDate"] + "</td>";
               var link = "<td>" + fire_event["link"] + "</td>";

               var newItem = "<tr class='data-maps__table-data'>" + title + timestamp + link + "</tr>";
               $(newItem).appendTo("#fire-data--table");
           });
       });

        loadMap("https://wildfire.cr.usgs.gov/ArcGIS/rest/services/geomac_dyn/MapServer", "fires");
    }

    if ($("#earthquake-data").length > 0) {
        var earthquake_url = $("#earthquake-url").text();

        earthquake_list = "";

        $.get(earthquake_url, function (data) {
            data.forEach(function (earthquake_event) {
                var properties = earthquake_event["properties"];

                var title = "<td>" + properties["title"] + "</td>";
                var timestamp = "<td>" + properties["time"] + "</td>";
                var link = "<td>" + properties["url"] + "</td>";

                var newItem = "<tr class='data-maps__table-data'>" + title + timestamp + link + "</tr>";
                $(newItem).appendTo("#earthquake-data--table");
            });
        });

        loadMap("http://sampleserver3.arcgisonline.com/ArcGIS/rest/services/Earthquakes/EarthquakesFromLastSevenDays/MapServer", "earthquakes");
    }

    if ($("#weather-data").length > 0) {
        var weather_url = $("#weather-url").text();

        weather_list = "";

        $.get(weather_url, function (data) {
            data.forEach(function (weather_event) {
                var properties = weather_event["entry"];

                var title = "<td>" + properties["title"] + "</td>";
                var timestamp = "<td>" + properties["updated"] + "</td>";
                var link = "<td>" + properties["link"]["href"] + "</td>";

                var newItem = "<tr class='data-maps__table-data'>" + title + timestamp + link + "</tr>";
                $(newItem).appendTo("#weather-data--table");
            });
        });

        loadMap("https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Climate_Outlooks/cpc_weather_hazards/MapServer", "hazards");
    }

    if ($("#rivers-data").length > 0) {
        var rivers_url = $("#rivers-url").text();

        rivers_list = "";

        $.get(rivers_url, function (data) {
            data.forEach(function (rivers_event) {
                var properties = rivers_event;

                var title = "<td>" + properties["title"] + "</td>";
                var timestamp = "<td>" + properties["pubDate"] + "</td>";
                var link = "<td>" + properties["link"] + "</td>";

                var newItem = "<tr class='data-maps__table-data'>" + title + timestamp + link + "</tr>";
                $(newItem).appendTo("#rivers-data--table");
            });
        });

        loadMap("https://idpgis.ncep.noaa.gov/arcgis/rest/services/NWS_Observations/ahps_riv_gauges/MapServer", "rivers");
    }

    if ($("#tsunami-data").length > 0) {
        var tsunami_url = $("#tsunami-url").text();

        tsunami_list = "";

        $.get(tsunami_url, function (data) {
            data.forEach(function (tsunami_event) {
                var properties = tsunami_event;

                var title = "<td>" + properties["title"] + "</td>";
                var timestamp = "<td>" + properties["pubDate"] + "</td>";
                var link = "<td>" + properties["link"] + "</td>";

                var newItem = "<tr class='data-maps__table-data'>" + title + timestamp + link + "</tr>";
                $(newItem).appendTo("#tsunami-data--table");
            });
        });

        loadMap("http://maps.gdc.govt.nz/arcgis/rest/services/Open_Data/GDC_hazard_geological/MapServer", "tsunami");
    }
});
