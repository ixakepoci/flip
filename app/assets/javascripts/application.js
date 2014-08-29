// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require bootstrap
//= require icheck.min
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){
resizeDiv();
});

window.onresize = function(event) {
resizeDiv();
}

function resizeDiv() {

vph = ($(window).height()-50)/5;
wrk = $(window).height()-50;
$('.btn').css({'height': vph + 'px'});
$('.btn').css({'width': vph + 'px'});
$('.img-responsive').css({'height': (vph-50) + 'px'});
$('.img-responsive').css({'width': (vph-50) + 'px'});
$('#left-nav').css({'width': vph + 'px'});
$('body').css({'height': wrk + 'px'});
}

