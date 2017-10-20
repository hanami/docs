(function($){
  $(".source_show").click(function() {
    $button = $(this)
    $source_code = $button.parent().parent().find('.source_code')
    $source_code.toggle()
  });

  var version = window.location.pathname.replace("/docs", "").replace(/\/$/, '');
  $("#select-version option[value='"+version+"']").prop("selected", true);

  $("#select-version").on("change", function(){
    var destination = "/" + this.value;
    window.location.pathname = destination;
  });
}(jQuery));
