require 'rails_helper_features'

RSpec.feature 'Deleta uma área' do
  given!(:admin) { create :user, :as_admin }
  given!(:area) { create :area }

  it 'deve deletar uma área' do
    sign_in_as_admin(admin)

    visit areas_path

    expect(page).to have_text(area.nome)

    click_on "destroy_area_#{area.id}"

    expect(page).to have_text('Área foi removida com sucesso')
  end

end
