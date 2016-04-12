require 'rails_helper_features'

RSpec.feature 'CanCan Teste' do
  given!(:user) { create :user }
  given!(:area) { create :area }

  context "Usuario visitante não pode acessar páginas restritas" do
    it 'verifica acesso visitante' do
      visit areas_path

      expect(page).to have_text("Você precisa se logar ou registrar antes de prosseguir.")
    end

    it 'verifica permissao do usuario' do
      sign_in_as_admin(user)

      visit edit_area_path(area)

      expect(page).to have_text("Você não está autorizado em executar esta ação")
    end
  end

end
