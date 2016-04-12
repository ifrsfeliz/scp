require 'rails_helper_features'

RSpec.feature 'Deve mostrar alunos' do
  given!(:admin) { create :user, :as_admin }
  given!(:student) { create :student }

  it 'Deve mostrar alunos' do
    sign_in_as_admin(admin)

    visit students_path

    click_on "show_student_#{student.id}"

    expect(page).to have_text('Exibindo Aluno')
    expect(page).to have_text(student.nome)
    expect(page).to have_text(student.cpf)
  end

end
