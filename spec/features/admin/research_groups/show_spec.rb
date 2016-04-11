require 'rails_helper_features'

RSpec.feature 'Deve mostrar área com grupos de pesquisa' do
  given!(:admin) { create :user, :as_admin }
  given!(:area) { create :area }
  given!(:research_group) { create :research_group, area: area }
  given!(:research_line) { create :research_line, research_group: research_group }

  it 'Deve mostrar um grupo de pesquisa e as linhas de pesquisa associadas' do
    sign_in_as_admin(admin)

    visit research_groups_path

    click_on "show_research_group_#{research_group.id}"

    expect(page).to have_text('Exibindo Grupo de Pesquisa')
    expect(page).to have_text(research_group.nome)
    expect(page).to have_text(research_line.nome)
  end

end
