require 'rails_helper_features'

RSpec.feature 'Edita Linha de Pesquisa' do
  given!(:admin) { create :user, :as_admin }
  given!(:research_group) { create :research_group }
  given!(:research_line) { create :research_line, research_group: research_group }

  context "Edição de linha de pesquisa no SCP" do

    it 'Edita uma linha de pesquisa com dados válidos' do
      sign_in_as_admin(admin)

      visit research_lines_path

      click_on "edit_research_line_#{research_line.id}"

      fill_in 'research_line_nome', with: 'Linha Pesquisa Teste'

      click_on 'Salvar'

      expect(page).to have_text("Linha de Pesquisa atualizada com sucesso.")
      expect(research_line.reload.nome).to eq("Linha Pesquisa Teste");
    end

    it 'Edita uma Linha de Pesqusia com dados inválidos' do
      sign_in_as_admin(admin)

      visit research_lines_path

      click_on "edit_research_line_#{research_line.id}"

      fill_in 'research_line_nome', with: ''

      click_on 'Salvar'

      expect(page).to have_text("não pode ficar em branco")
    end
  end
end
