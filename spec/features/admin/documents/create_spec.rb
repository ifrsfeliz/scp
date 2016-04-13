require 'rails_helper_features'

RSpec.feature 'Cria Aluno' do
  given!(:admin) { create :user, :as_admin }

  context "Inclusão de aluno no SCP" do

    it 'cria um novo aluno com dados válidos' do
      sign_in_as_admin(admin)

      visit students_path

      click_on 'Novo Aluno'

      fill_in 'student_nome', with: 'Aluno Teste SCP'
      fill_in 'student_cpf', with: '000.000.000-00'
      fill_in 'student_rg', with: '0000000000'
      fill_in 'student_email', with: 'email@researcher.com.br'
      fill_in 'student_telefone', with: '51 0000-0000'
      fill_in 'student_celular', with: '51 0000-0000'
      attach_file 'student_documents', File.join(Rails.root, '/spec/fixtures/blank.pdf')

      click_on 'Salvar'

      expect(page).to have_text("Aluno criado com sucesso.")
    end

    it 'cria um novo aluno com dados inválidos' do
      sign_in_as_admin(admin)

      visit students_path

      click_on 'Novo Aluno'

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end

end
