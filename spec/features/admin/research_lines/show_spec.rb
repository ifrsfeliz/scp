require 'rails_helper_features'

RSpec.feature 'Deve mostrar linha de pesquisa com projetos associados' do
  given!(:admin) { create :user, :as_admin }
  given!(:area) { create :area }
  given!(:research_group) { create :research_group, area: area }
  given!(:research_line) { create :research_line, research_group: research_group }
  given!(:project) { create :project, research_line: research_line }

  it 'Deve mostrar uma linha de pesquisa e os projetos associados' do
    sign_in_as_admin(admin)

    visit research_lines_path

    click_on "show_research_line_#{research_line.id}"

    expect(page).to have_text('Exibindo Linha de Pesquisa')
    expect(page).to have_text(research_line.nome)
    expect(page).to have_text(project.nome)
  end

end
