ready = ->
  # enable chosen js
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '100%'

  $('form').checkBo();

$(document).ready(ready)
$(document).on('page:load', ready)
