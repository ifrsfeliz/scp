require 'rails_helper_features'

RSpec.feature 'Deleta um Aluno' do
  given!(:admin) { create :user, :as_admin }
  given!(:student) { create :student }

  it 'deve deletar uma aluno' do
    sign_in_as_admin(admin)

    visit students_path

    expect(page).to have_text(student.nome)

    click_on "destroy_student_#{student.id}"

    expect(page).to have_text('Aluno removido com sucesso.')
  end

end
