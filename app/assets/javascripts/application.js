// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function(){
  // Remove Cache
//  jQuery('div').live('pagehide', function(event, ui){
//    var page = jQuery(event.target);
//
//    if(page.attr('data-cache') == 'never'){
//      page.remove();
//    };
//  });

  // "Add" button to add PIZZA
  //
  $(document).on("click", ".form-submit", function(){
    $('.pizza-form').submit();
  });

//  $(document).on("change", ".special .ui-checkbox", function() {
//    $(".special-check").prop('checked', true);
//    $(".special-label").addClass("ui-btn-active");
//  });

});
