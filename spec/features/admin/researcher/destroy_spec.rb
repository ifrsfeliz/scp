require 'rails_helper_features'

RSpec.feature 'Deleta um Pesquisador' do
  given!(:admin) { create :user, :as_admin }
  given!(:researcher) { create :researcher }

  it 'deve deletar uma pesquisador' do
    sign_in_as_admin(admin)

    visit researchers_path

    expect(page).to have_text(researcher.nome)

    click_on "destroy_researcher_#{researcher.id}"

    expect(page).to have_text('Pesquisador removido com sucesso.')
  end

end
