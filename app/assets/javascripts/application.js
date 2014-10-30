// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
$(function() {
    $('.rating_star').click(function() {
        var star = $(this);
        var form_id = star.attr("data-form-id");
        var stars = star.attr("data-stars");
        $('#' + form_id + '_stars').val(stars);

        $.ajax({
            type: "post",
            url: $('#' + form_id).attr('action') + '.json',
            data: $('#' + form_id).serialize(),
            success: function(response){
                console.log(response);
                update_stars();
                if(response["avg_rating"]){
                    $('#average_rating').text(response["avg_rating"]);
                }
            }
        })
    });
});

function update_stars(){
    $('.star_rating_form').each(function() {
        var form_id = $(this).attr('id');
        set_stars(form_id, $('#' + form_id + '_stars').val());
    });
}

function set_stars(form_id, stars) {
    for(i = 1; i <= 5; i++){
        if(i <= stars){
            $('#' + form_id + '_' + i).addClass("on");
        } else {
            $('#' + form_id + '_' + i).removeClass("on");
        }
    }
}
