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
    $(".sidebar_box").delegate("form.new_comment input.btn", "click", function() {
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
                if (data["status"] == "success") {
                    $("#login_form").toggle();
                    $('<form accept-charset="UTF-8" action="/movies/' + document.URL.split("/")[4] + '/comments" class="new_comment" id="new_comment" method="post"> <textarea cols="40" id="comment_content" name="comment[content]" placeholder="一起来聊聊吧..." rows="2"></textarea> <input class="btn btn-primary" data-loading-text="发布中..." name="commit" type="submit" value="发布"> </form>').insertAfter("#login_form");
                }
            }, "json"
        );

        return false;        
    });
});


