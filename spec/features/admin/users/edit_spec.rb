require 'rails_helper_features'

RSpec.feature 'Edit users' do
  given!(:role_admin) { create :role, :admin }
  given!(:role_comum) { create :role }
  given!(:admin) { create :user, :as_admin }
  given!(:admin_not_authorized) { create :user, :as_admin, admin_authorization: false }

  context "Admin autoriza usuário a logar" do
    it 'altera permissão do usuário' do
      sign_in_as_admin(admin)

      visit users_path

      click_on "edit_#{admin_not_authorized.id}"

      check 'user_admin_authorization'

      click_on 'Salvar Usuário'

      expect(page).to have_text('Usuário atualizado com Sucesso.')
      expect(admin_not_authorized.reload.admin_authorization).to eq(true)
    end
  end

end
