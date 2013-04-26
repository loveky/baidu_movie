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

    // add new comment
    $("form.new_comment input.btn").click(function() {
        //alert($(this).siblings("textarea").val()); $(this).parent().attr("action")
        $.post($(this).parent().attr("action"), {"comment" : {"content" : $(this).siblings("textarea").val()}},
            function(data) {
                $('<div class="comment_entry"><div class="comment_content">' + data["content"] + '</div> <div class="comment_info"> -- 你评论于less than a minute前 </div> </div>').prependTo("#comment_list");
                $("form.new_comment input.btn").button("reset");
            }, "json"
        );
        $(this).button("loading");
        return false;
    });

    // toggle login form on play page when click on login button
    $("#login_button").click(function () {
        $("#login_form").toggle("fast");
        $(this).parent().toggle();
    });

    // login throught comment login form
    $("#login_form form button").click(function() {
        $.post($(this).parent().attr("action"), {"username" : $(this).siblings("input[type='text']").val(), "password" : $(this).siblings("input[type='password']").val()},
            function(data) {
                console.log(data);
            }, "json"
        );

        return false;        
    });
});