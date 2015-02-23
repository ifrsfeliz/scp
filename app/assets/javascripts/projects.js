$(document).ready(function(){
  $('#member_students').bind('cocoon:before-insert', function(e, member_student_to_be_added) {
    member_student_to_be_added.fadeIn('slow');
    console.log('Callback antes de mostrar formulário');
  }).bind('cocoon:before-remove', function(e, member_student) {
    // allow some time for the animation to complete
    console.log('Callback antes de remover formulário');
    $(this).data('remove-timeout', 1000);
    member_student.fadeOut('slow');
   });
})
