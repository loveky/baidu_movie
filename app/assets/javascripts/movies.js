$(document).ready(function () {
    // make navagation bar align center
    $("div.pagination ul").css("margin-left", ($("div.pagination").width() - $("div.pagination ul").width()) / 2 + "px" );

    // redirect to search result page when click search button
    $("button#search").click(function() {
        window.location = window.location.origin + "/search/" + $("#search").siblings("input").val()
    });
});

