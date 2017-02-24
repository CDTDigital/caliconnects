$(document).ready(function(){
    if($("#signup-marker")) {
        window.location = "#1";

        var moveToPreviousPage = function() {
            var hash = window.location.hash;
            var hashNumber = hash.split("#")[1];

            var currPageSelector = "#signup-page-" + (hashNumber);

            $(".signup-page").hide();
            $(currPageSelector).show();
        };

        var moveToNextPage = function(){
            var visible = $(".signup-page:visible").attr("data-pagenumber");
            var currPageNumber = Number(visible);
            var nextPageNumber = currPageNumber + 1;

            var currPageSelector = "#signup-page-" + currPageNumber;
            var nextPageSelector = "#signup-page-" + nextPageNumber;

            window.location = "#" + nextPageNumber;

            $(currPageSelector).hide();
            $(nextPageSelector).show();
        };

        var clickTheNextButton = function (e) {
            if (e.which == 13) {
                $("#signup-page__next-button").trigger("click");
                return false;
            }
        };

        $(".signup-page__next-button").on("click", moveToNextPage);

        $(window).bind('hashchange', moveToPreviousPage);

        $("input").keypress(clickTheNextButton);
    }
});