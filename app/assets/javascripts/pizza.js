$(document).ready(function(){
  // Limita marcar 4 sabores
  //
  $(".flavor input[type='checkbox']").bind("change", function() {
    var count = $(".flavor input[type='checkbox']:checked").length;
    if(count > 4) { $(this).prop('checked', false); }
  });

  // Marca "especial" para pizzas especiais
  // 
  $(".special input[type='checkbox']").bind("change", function() {
    var count = $(".special input[type='checkbox']:checked").length;

    if(count >= 1){
      $(".special-check").prop('checked', true);
    } else {
      $(".special-check").prop('checked', false);
    }
  });
});
