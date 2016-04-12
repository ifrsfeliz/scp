require 'rails_helper_features'

RSpec.feature 'Cria Tipo de Bolsa' do
  given!(:admin) { create :user, :as_admin }

  context "Inclusão de Tipo de Bolsas no SCP" do

    it 'cria um novo tipo de bolsa com dados válidos' do
      sign_in_as_admin(admin)

      visit scholarship_types_path

      click_on 'Novo Tipo de Bolsa'

      fill_in 'scholarship_type_nome', with: 'Teste'

      click_on 'Salvar'

      expect(page).to have_text("Tipo de Bolsa criado com sucesso.")
    end

    it 'cria um tipo de bolsa com dados inválidos' do
      sign_in_as_admin(admin)

      visit scholarship_types_path

      click_on 'Novo Tipo de Bolsa'

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end

end
