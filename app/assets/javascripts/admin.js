$(document).ready(function(){
    if($("#admin-alert-marker").length > 0) {
        $(".location-container").hide();

        $(".admin-alert-location-button").click(function(e) {
            e.preventDefault();

            var locationLevel = $(this).attr("data-locationlevel");

            $(".location-container").hide();

            $("#location-container-" + locationLevel).
                show().
                find("input").
                val("");
        });
    }
});
