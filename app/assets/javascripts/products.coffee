# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $(document).on "click", ".add", ->
    quantity = parseInt($(".quantity").val());
    $(".quantity").val(quantity + 1);
    $(".span-quantity").html(quantity + 1);

  $(document).on "click", ".remove", ->
    quantity = parseInt($(".quantity").val());
    unless quantity == 1
      $(".quantity").val(quantity - 1);
      $(".span-quantity").html(quantity - 1);
