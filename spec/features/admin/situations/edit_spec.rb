require 'rails_helper_features'

RSpec.feature 'Edita Situação' do
  given!(:admin) { create :user, :as_admin }
  given!(:situation) { create :situation }

  context "Edição de situações no SCP" do

    it 'Edita uma situação existente com dados válidos' do
      sign_in_as_admin(admin)

      visit situations_path

      expect(page).to have_text(situation.nome)

      click_on "edit_situation_#{situation.id}"

      fill_in 'situation_nome', with: 'Teste 2'

      click_on 'Salvar'

      expect(page).to have_text("Situação atualizada com sucesso.")
      expect(situation.reload.nome).to eq('Teste 2')
    end

    it 'Edita uma situação com dados inválidos' do
      sign_in_as_admin(admin)

      visit situations_path

      click_on "edit_situation_#{situation.id}"

      fill_in 'situation_nome', with: ''

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end
end
