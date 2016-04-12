require 'rails_helper_features'

RSpec.feature 'Deve mostrar a situação' do
  given!(:admin) { create :user, :as_admin }
  given!(:situation) { create :situation }

  it 'Deve mostrar uma situação' do
    sign_in_as_admin(admin)

    visit situations_path

    click_on "show_situation_#{situation.id}"

    expect(page).to have_text('Exibindo Situação')
    expect(page).to have_text(situation.nome)
  end

end
