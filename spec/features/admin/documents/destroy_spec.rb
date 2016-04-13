require 'rails_helper_features'

RSpec.feature 'Deleta um Documento' do
  given!(:admin) { create :user, :as_admin }
  given!(:student) { create :student }
  given!(:document) { create :document, student: student }

  it 'deve deletar um documento' do
    sign_in_as_admin(admin)
    visit students_path

    expect(page).to have_text(student.nome)

    click_on "show_student_#{student.id}"
    expect(page).to have_text('Exibindo Aluno')

    click_on 'Deletar'
    expect(page).to have_text('Documento removido com sucesso.')
  end
end
