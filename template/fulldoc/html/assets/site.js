(function($){
  $(".source_show").click(function() {
    $button = $(this)
    $source_code = $button.parent().parent().find('.source_code')
    $source_code.toggle()
  });
}(jQuery));
