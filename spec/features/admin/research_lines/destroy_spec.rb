require 'rails_helper_features'

RSpec.feature 'Deleta um Grupo de Pesquisa' do
  given!(:admin) { create :user, :as_admin }
  given!(:research_line) { create :research_line }

  it 'deve deletar uma linha de pesquisa' do
    sign_in_as_admin(admin)

    visit research_lines_path

    expect(page).to have_text(research_line.nome)

    click_on "destroy_research_line_#{research_line.id}"

    expect(page).to have_text('Linha de Pesquisa removida com sucesso.')
  end

end
