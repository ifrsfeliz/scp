require 'rails_helper_features'

RSpec.feature 'Edita Pesquisador' do
  given!(:admin) { create :user, :as_admin }
  given!(:researcher) { create :researcher }

  context "Edição Pesquisador no SCP" do

    it 'Edita um pesquisador com dados válidos' do
      sign_in_as_admin(admin)

      visit researchers_path

      click_on "edit_researcher_#{researcher.id}"

      fill_in 'researcher_nome', with: 'Pesquisador teste edit'
      fill_in 'researcher_cpf', with: '111.111.111-11'
      attach_file 'researcher_documents', File.join(Rails.root, '/spec/fixtures/blank.pdf')

      click_on 'Salvar'

      expect(page).to have_text("Pesquisador atualizado com sucesso.")
      expect(researcher.reload.nome).to eq("Pesquisador teste edit")
    end

    it 'Edita um pesquisador com dados inválidos' do
      sign_in_as_admin(admin)

      visit researchers_path

      click_on "edit_researcher_#{researcher.id}"

      fill_in 'researcher_nome', with: ''

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end
end
