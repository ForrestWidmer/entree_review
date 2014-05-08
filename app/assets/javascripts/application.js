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
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){

  var $img = $("#image-group")
  $img.hide()
    $("#all-images").click(function(){
      $img.toggle("slow");
    });

  $("#iframe").hide().fadeIn(2000);

  $(".new_image").hide();
    $("#img-button").click(function(){
      $(".new_image").toggle("slow");
    });

  // $('#new_image_button').click(function(){
  //   $('#new_image').fileupload()
  // });
});