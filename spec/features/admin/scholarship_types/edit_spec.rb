require 'rails_helper_features'

RSpec.feature 'Edita Tipo de Bolsa' do
  given!(:admin) { create :user, :as_admin }
  given!(:scholarship_type) { create :scholarship_type }

  context "Edição de Tipo de Bolsas no SCP" do

    it 'Edita um tipo de bolsa existente com dados válidos' do
      sign_in_as_admin(admin)

      visit scholarship_types_path

      expect(page).to have_text(scholarship_type.nome)

      click_on "edit_scholarship_type_#{scholarship_type.id}"

      fill_in 'scholarship_type_nome', with: 'Teste 2'

      click_on 'Salvar'

      expect(page).to have_text("Tipo de Bolsa atualizado com sucesso.")
      expect(scholarship_type.reload.nome).to eq('Teste 2')
    end

    it 'Edita um tipo de bolsa com dados inválidos' do
      sign_in_as_admin(admin)

      visit scholarship_types_path

      click_on "edit_scholarship_type_#{scholarship_type.id}"

      fill_in 'scholarship_type_nome', with: ''

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end
end
