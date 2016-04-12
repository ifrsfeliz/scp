require 'rails_helper_features'

RSpec.feature 'Cria Pesquisador' do
  given!(:admin) { create :user, :as_admin }

  context "Inclusão de pesquisador no SCP" do

    it 'cria um novo pesquisador com dados válidos' do
      sign_in_as_admin(admin)

      visit researchers_path

      click_on 'Novo Pesquisador'

      fill_in 'researcher_nome', with: 'Pesquisador Teste SCP'
      fill_in 'researcher_cpf', with: '000.000.000-00'
      fill_in 'researcher_rg', with: '0000000000'
      fill_in 'researcher_email', with: 'email@researcher.com.br'
      fill_in 'researcher_link_lattes', with: 'http://linkdolattes.com.br'
      fill_in 'researcher_telefone', with: '51 0000-0000'
      fill_in 'researcher_celular', with: '51 0000-0000'
      attach_file 'researcher_documents', File.join(Rails.root, '/spec/fixtures/blank.pdf')

      click_on 'Salvar'

      expect(page).to have_text("Pesquisador criado com sucesso.")
    end

    it 'cria um novo pesquisador com dados inválidos' do
      sign_in_as_admin(admin)

      visit researchers_path

      click_on 'Novo Pesquisador'

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end

end
