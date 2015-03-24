var ready;

ready = function() {
  $("#member_researchers a.add_fields").
    data("association-insertion-position", 'append').
    data("association-insertion-node", '#member_researchers');

  $('#member_researchers').bind('cocoon:before-insert', function(e, member_researcher_to_be_added) {
    member_researcher_to_be_added.fadeIn('slow');
    console.log('Callback antes de mostrar formulário');
  }).bind('cocoon:before-remove', function(e, member_researcher) {
    // allow some time for the animation to complete
    console.log('Callback antes de remover formulário');
    $(this).data('remove-timeout', 1000);
    member_researcher.fadeOut('slow');
  });

  $("#member_students a.add_fields").
    data("association-insertion-position", 'append').
    data("association-insertion-node", '#member_students');

  $('#member_students').bind('cocoon:before-insert', function(e, member_student_to_be_added) {
    member_student_to_be_added.fadeIn('slow');
    console.log('Callback antes de mostrar formulário');
  }).bind('cocoon:before-remove', function(e, member_student) {
    // allow some time for the animation to complete
    console.log('Callback antes de remover formulário');
    $(this).data('remove-timeout', 1000);
    member_student.fadeOut('slow');
  });

  $("#reports a.add_fields").
    data("association-insertion-position", 'append').
    data("association-insertion-node", '#reports');

  $('#reports').bind('cocoon:before-insert', function(e, report_to_be_added) {
    report_to_be_added.fadeIn('slow');
    console.log('Callback antes de mostrar formulário');
  }).bind('cocoon:before-remove', function(e, report) {
    // allow some time for the animation to complete
    console.log('Callback antes de remover formulário');
    $(this).data('remove-timeout', 1000);
    report.fadeOut('slow');
  });

  if ($('#project_auxilio_aipct').prop('checked')) {
  } else {
    $('.project_valor_aipct').hide();
    $('#project_valor_aipct').val('0,00');
  }

  $('#project_auxilio_aipct').change(function() {
    if($(this).prop('checked')) {
      $('.project_valor_aipct').show();
    } else {
      $('.project_valor_aipct').hide();
      $('#project_valor_aipct').val('0,00');
    }
  });
};

$(document).ready(ready);

$(document).on('page:load', ready);
