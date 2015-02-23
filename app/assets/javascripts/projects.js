var ready;

ready = function() {
  $('#member_professors').bind('cocoon:before-insert', function(e, member_professor_to_be_added) {
    member_professor_to_be_added.fadeIn('slow');
    console.log('Callback antes de mostrar formulário');
  }).bind('cocoon:before-remove', function(e, member_professor) {
    // allow some time for the animation to complete
    console.log('Callback antes de remover formulário');
    $(this).data('remove-timeout', 1000);
    member_professor.fadeOut('slow');
  });

  $('#member_students').bind('cocoon:before-insert', function(e, member_student_to_be_added) {
    member_student_to_be_added.fadeIn('slow');
    console.log('Callback antes de mostrar formulário');
  }).bind('cocoon:before-remove', function(e, member_student) {
    // allow some time for the animation to complete
    console.log('Callback antes de remover formulário');
    $(this).data('remove-timeout', 1000);
    member_student.fadeOut('slow');
  });

  if ($('#project_auxilio_aipct').prop('checked')) {
    console.log('é true!')
  } else {
    $('.project_valor_aipct').hide();
    $('#project_valor_aipct').val('0,00');
  }

  $('#project_auxilio_aipct').change(function() {
    if($(this).prop('checked')) {
      $('.project_valor_aipct').show();
      console.log('Test')
    } else {
      console.log('Test2')
      $('.project_valor_aipct').hide();
      $('#project_valor_aipct').val('0,00');
    }
  });
};

$(document).ready(ready);

$(document).on('page:load', ready);
