var ready;

ready = function() {
  $('.chosen-select').chosen({
      allow_single_deselect: true,
      no_results_text: 'No results matched',
      width: '100%'
    });

  $('form').checkBo();

  $('body').on('focus',".date", function(){
      $(this).datetimepicker();
  });
};

$(document).ready(ready);

$(document).on('page:load', ready);
