$(document).ready(function(){

    if($("#signup-marker").length > 0) {
        window.location = "#1";

        var showUrlPage = function() {
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

            $(new_user).enableClientSideValidations();
        };

        var clickTheNextButton = function (e) {
            if (e.which == 13) {
                $("#signup-page__next-button").trigger("click");
                return true;
            }
        };

        var moveToPreviousPage = function() {
            var visible = $(".signup-page:visible").attr("data-pagenumber");
            var currPageNumber = Number(visible);

            window.location = "#" + (currPageNumber - 1);

            showUrlPage();
        };

        $(".signup-page__next-button").on("click", moveToNextPage);

        $(".signup-page__back-button").on("click", moveToPreviousPage);

        $(window).bind('hashchange', showUrlPage);

        $("input").keypress(clickTheNextButton);
    }
});
