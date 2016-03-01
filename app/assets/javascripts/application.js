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
  // 
  //jQuery('div').live('pagehide', function(event, ui){
  //  var page = jQuery(event.target);

  //  if(page.attr('data-cache') == 'never'){
  //    page.remove();
  //  };
  //});

  // SHOW LOADING
  //
  $( document ).on( "click", ".show-page-loading-msg", function() {
    var $this = $( this ),
      theme = $this.jqmData( "theme" ) || $.mobile.loader.prototype.options.theme,
      msgText = $this.jqmData( "msgtext" ) || $.mobile.loader.prototype.options.text,
      textVisible = $this.jqmData( "textvisible" ) || $.mobile.loader.prototype.options.textVisible,
      textonly = !!$this.jqmData( "textonly" );
      html = $this.jqmData( "html" ) || "";
    $.mobile.loading( "show", {
      text: msgText,
      textVisible: textVisible,
      theme: theme,
      textonly: textonly,
      html: html
    });
  })

  // HIDE LOADING
  // 
  $(document).ajaxStop(function() {
    $.mobile.loading('hide');
  });

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
      $(".special-label").addClass("ui-btn-active");
    } else {
      $(".special-check").prop('checked', false);
      $(".special-label").removeClass("ui-btn-active");
    }
  });

});
