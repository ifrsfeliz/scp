require 'rails_helper_features'

RSpec.feature 'Cria Linha de Pesquisa' do
  given!(:admin) { create :user, :as_admin }
  given!(:research_group) { create :research_group }

  context "Inclusão de linha de pesquisa no SCP" do

    it 'cria uma nova linha de pesquisa com dados válidos' do
      sign_in_as_admin(admin)

      visit research_lines_path

      click_on 'Nova Linha de Pesquisa'

      fill_in 'research_line_nome', with: 'Linha Pesq Teste'
      select "#{research_group.nome}", :from => "research_line_research_group_id"

      click_on 'Salvar'

      expect(page).to have_text("Linha de Pesquisa criada com sucesso.")
    end

    it 'cria uma nova linha de pesquisa com dados inválidos' do
      sign_in_as_admin(admin)

      visit research_lines_path

      click_on 'Nova Linha de Pesquisa'

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end

end
