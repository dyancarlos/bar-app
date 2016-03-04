//= require jquery
//= require jquery_ujs

$(document).ready(function(){
  if ($(".orders").length > 0) {
    setTimeout(updateOrders, 1000);
  }
});

function updateOrders(){
  var type = $('.categories').attr('data-type');
  $.getScript("/shower.js?type=" + type)
  setTimeout(updateOrders, 1000);
}
