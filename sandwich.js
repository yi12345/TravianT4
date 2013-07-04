function test() {
	alert("testing");
}

var j = jQuery.noConflict();

j(function(){

j(document).keydown(function(e) {
    if(e.which == 27 && j("div.popup3.quest").length > 0) {
        qst_handle();
    }
});


});