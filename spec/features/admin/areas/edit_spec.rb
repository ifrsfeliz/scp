require 'rails_helper_features'

RSpec.feature 'Edita área' do
  given!(:admin) { create :user, :as_admin }
  given!(:area) { create :area }

  context "Edição de áreas no SCP" do

    it 'Edita uma área existente com dados válidos' do
      sign_in_as_admin(admin)

      visit areas_path

      expect(page).to have_text(area.nome)

      click_on "edit_area_#{area.id}"

      fill_in 'area_nome', with: 'Teste 2'

      click_on 'Salvar'

      expect(page).to have_text("Área foi atualizada com sucesso.")
      expect(area.reload.nome).to eq('Teste 2')
    end

    it 'Edita uma área com dados inválidos' do
      sign_in_as_admin(admin)

      visit areas_path

      click_on "edit_area_#{area.id}"

      fill_in 'area_nome', with: ''

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end
end
