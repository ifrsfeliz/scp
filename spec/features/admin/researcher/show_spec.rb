require 'rails_helper_features'

RSpec.feature 'Deve mostrar pesquisadores' do
  given!(:admin) { create :user, :as_admin }
  given!(:researcher) { create :researcher }

  it 'Deve mostrar pesquisadores' do
    sign_in_as_admin(admin)

    visit researchers_path

    click_on "show_researcher_#{researcher.id}"

    expect(page).to have_text('Exibindo Pesquisador')
    expect(page).to have_text(researcher.nome)
    expect(page).to have_text(researcher.cpf)
  end

end
