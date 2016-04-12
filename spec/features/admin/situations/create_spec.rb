require 'rails_helper_features'

RSpec.feature 'Cria Situações' do
  given!(:admin) { create :user, :as_admin }

  context "Inclusão de situações no SCP" do

    it 'cria uma nova situação com dados válidos' do
      sign_in_as_admin(admin)

      visit situations_path

      click_on 'Nova Situação'

      fill_in 'situation_nome', with: 'Teste'

      click_on 'Salvar'

      expect(page).to have_text("Situação criada com sucesso.")
    end

    it 'cria uma nova situação com dados inválidos' do
      sign_in_as_admin(admin)

      visit situations_path

      click_on 'Nova Situação'

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end

end
