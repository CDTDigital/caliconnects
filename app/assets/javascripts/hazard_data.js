/**
 * Created by sfgarage on 2/27/17.
 */

$(document).ready(function(){
    if ($("#fire-data").length > 0){
       var fire_url = $("#fire-url").text();

       fire_list = "";

       $.get(fire_url, function(data){
           data.forEach(function(fire_event){
               console.log(fire_event);

               var title = "<td>" + fire_event["title"] + "</td>";
               var timestamp = "<td>" + fire_event["pubDate"] + "</td>";
               var link = "<td>" + fire_event["link"] + "</td>";

               var newItem = "<tr>" + title + timestamp + link + "</tr>";
               $(newItem).appendTo("#fire-data--table");
           });
       });
    }

    if ($("#earthquake-data").length > 0) {
        var earthquake_url = $("#earthquake-url").text();

        earthquake_list = "";

        $.get(earthquake_url, function (data) {
            data.forEach(function (earthquake_event) {
                console.log(earthquake_event["properties"]);

                var properties = earthquake_event["properties"];

                var title = "<td>" + properties["title"] + "</td>";
                var timestamp = "<td>" + properties["time"] + "</td>";
                var link = "<td>" + properties["url"] + "</td>";

                var newItem = "<tr>" + title + timestamp + link + "</tr>";
                $(newItem).appendTo("#earthquake-data--table");
            });
        });
    }

    if ($("#weather-data").length > 0) {
        var weather_url = $("#weather-url").text();

        weather_list = "";

        $.get(weather_url, function (data) {
            data.forEach(function (weather_event) {
                console.log(weather_event);

                var properties = weather_event["entry"];

                var title = "<td>" + properties["title"] + "</td>";
                var timestamp = "<td>" + properties["updated"] + "</td>";
                var link = "<td>" + properties["link"]["href"] + "</td>";

                var newItem = "<tr>" + title + timestamp + link + "</tr>";
                $(newItem).appendTo("#weather-data--table");
            });
        });
    }

    if ($("#rivers-data").length > 0) {
        var rivers_url = $("#rivers-url").text();

        rivers_list = "";

        $.get(rivers_url, function (data) {
            data.forEach(function (rivers_event) {
                console.log(rivers_event);

                var properties = rivers_event;

                var title = "<td>" + properties["title"] + "</td>";
                var timestamp = "<td>" + properties["pubDate"] + "</td>";
                var link = "<td>" + properties["link"] + "</td>";

                var newItem = "<tr>" + title + timestamp + link + "</tr>";
                $(newItem).appendTo("#rivers-data--table");
            });
        });
    }

    if ($("#tsunami-data").length > 0) {
        var tsunami_url = $("#tsunami-url").text();

        tsunami_list = "";

        $.get(tsunami_url, function (data) {
            data.forEach(function (tsunami_event) {
                console.log(tsunami_event);

                var properties = tsunami_event;

                var title = "<td>" + properties["title"] + "</td>";
                var timestamp = "<td>" + properties["pubDate"] + "</td>";
                var link = "<td>" + properties["link"] + "</td>";

                var newItem = "<tr>" + title + timestamp + link + "</tr>";
                $(newItem).appendTo("#tsunami-data--table");
            });
        });
    }
});