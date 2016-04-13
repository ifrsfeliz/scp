FactoryGirl.define do
  factory :member_student do
    student
    project
    tipo_vinculo 'Aluno Bolsista'
    data_inicio Date.today - 30.days
    data_fim Date.today
  end
end
