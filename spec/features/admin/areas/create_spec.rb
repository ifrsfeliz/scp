require 'rails_helper_features'

RSpec.feature 'Cria areas' do
  given!(:admin) { create :user, :as_admin }

  context "Inclusão de áreas no SCP" do

    it 'cria uma nova área com dados válidos' do
      sign_in_as_admin(admin)

      visit areas_path

      click_on 'Nova Área'

      fill_in 'area_nome', with: 'Teste'

      click_on 'Salvar'

      expect(page).to have_text("Área foi criada com sucesso.")
    end

    it 'cria uma nova área com dados inválidos' do
      sign_in_as_admin(admin)

      visit areas_path

      click_on 'Nova Área'

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end

end
