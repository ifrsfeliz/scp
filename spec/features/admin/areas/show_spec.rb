require 'rails_helper_features'

RSpec.feature 'Deve mostrar área com grupos de pesquisa' do
  given!(:admin) { create :user, :as_admin }
  given!(:area) { create :area }
  given!(:research_group) { create :research_group, area: area }

  it 'Deve mostrar uma área e os grupos associados' do
    sign_in_as_admin(admin)

    visit areas_path

    click_on "show_area_#{area.id}"

    expect(page).to have_text('Exibindo Área')
    expect(page).to have_text(area.nome)
    expect(page).to have_text(research_group.nome)
  end

end
