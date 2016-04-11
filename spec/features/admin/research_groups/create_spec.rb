require 'rails_helper_features'

RSpec.feature 'Cria Grupo de Pesquisa' do
  given!(:admin) { create :user, :as_admin }
  given!(:researcher) { create :researcher }
  given!(:area) { create :area }

  context "Inclusão de grupo de pesquisa no SCP" do

    it 'cria um novo grupo de pesquisa com dados válidos' do
      sign_in_as_admin(admin)

      visit research_groups_path

      click_on 'Novo Grupo de Pesquisa'

      fill_in 'research_group_nome', with: 'Grupo Teste'
      select "#{researcher.nome}", :from => "research_group_researcher_id"
      fill_in 'research_group_link_grupo_cnpq', with: 'http://linkteste.com'
      select "#{area.nome}", :from => "research_group_area_id"
      fill_in 'research_group_ultima_verificacao', with: Time.now

      click_on 'Salvar'

      expect(page).to have_text("Grupo de Pesquisa criado com sucesso.")
    end

    it 'cria uma nova área com dados inválidos' do
      sign_in_as_admin(admin)

      visit research_groups_path

      click_on 'Novo Grupo de Pesquisa'

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end

end
