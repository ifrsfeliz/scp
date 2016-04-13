FactoryGirl.define do
  factory :document do
    file_content_type 'pdf'
    file_file_name 'nome_documento.pdf'
    file_file_size 10
    association :researcher_id, factory: :researcher
    association :student_id, factory: :student
  end
end
