require 'rails_helper_features'

RSpec.feature 'Edita Grupo de Pesquisa' do
  given!(:admin) { create :user, :as_admin }
  given!(:researcher) { create :researcher }
  given!(:area) { create :area }
  given!(:research_group) { create :research_group, area: area, researcher: researcher }

  context "Edição de grupo de pesquisa no SCP" do

    it 'Edita um grupo de pesquisa com dados válidos' do
      sign_in_as_admin(admin)

      visit research_groups_path

      click_on "edit_research_group_#{research_group.id}"

      fill_in 'research_group_nome', with: 'Grupo Teste'

      click_on 'Salvar'

      expect(page).to have_text("Grupo de Pesquisa atualizado com sucesso.")
      expect(research_group.reload.nome).to eq("Grupo Teste");
    end

    it 'Edita um Grupo de Pesqusia com dados inválidos' do
      sign_in_as_admin(admin)

      visit research_groups_path

      click_on "edit_research_group_#{research_group.id}"

      fill_in 'research_group_nome', with: ''

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end
end
