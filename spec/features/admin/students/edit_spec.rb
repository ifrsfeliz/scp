require 'rails_helper_features'

RSpec.feature 'Edita Aluno' do
  given!(:admin) { create :user, :as_admin }
  given!(:student) { create :student }

  context "Edição de Aluno no SCP" do

    it 'Edita um aluno com dados válidos' do
      sign_in_as_admin(admin)

      visit students_path

      click_on "edit_student_#{student.id}"

      fill_in 'student_nome', with: 'Aluno teste edit'
      fill_in 'student_cpf', with: '111.111.111-11'
      attach_file 'student_documents', File.join(Rails.root, '/spec/fixtures/blank.pdf')

      click_on 'Salvar'

      expect(page).to have_text("Aluno atualizado com sucesso.")
      expect(student.reload.nome).to eq("Aluno teste edit")
    end

    it 'Edita um aluno com dados inválidos' do
      sign_in_as_admin(admin)

      visit students_path

      click_on "edit_student_#{student.id}"

      fill_in 'student_nome', with: ''

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end
end
