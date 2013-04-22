$(document).ready(function () {
    // make navagation bar align center
    $("div.pagination ul").css("margin-left", ($("div.pagination").width() - $("div.pagination ul").width()) / 2 + "px" );

    // redirect to search result page when click search button
    $("button#search").click(function() {
        if ($(this).siblings("input").val() != "") {
            window.location = window.location.origin + "/search/" + $(this).siblings("input").val();
        }
    }).siblings("input").keypress(function(e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code == 13) { //Enter keycode
            $(this).siblings("#search").click();
        }
    });
});

