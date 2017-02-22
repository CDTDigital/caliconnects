$(document).ready(function(){

    $(".signup-page__next-button").on("click", function(){
        var visible = $(".signup-page:visible").attr("data-pagenumber");
        var currPageNumber = Number(visible);
        var nextPageNumber = currPageNumber + 1;

        var currPageSelector = "#signup-page-" + currPageNumber;
        var nextPageSelector = "#signup-page-" + nextPageNumber;

        $(currPageSelector).hide();
        $(nextPageSelector).show();
    });

    // email, password, password matching, phone, location

});