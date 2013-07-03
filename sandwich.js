var sandwich_test = $.noConflict();

(function ($) {

$(document).keydown(function(e) {
    if(e.which == 27 && $("div.popup3.quest").length > 0) {
        qst_handle();
    }
});

})(sandwich_test);