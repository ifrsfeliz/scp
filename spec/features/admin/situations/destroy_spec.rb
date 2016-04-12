require 'rails_helper_features'

RSpec.feature 'Deleta uma situação' do
  given!(:admin) { create :user, :as_admin }
  given!(:situation) { create :situation }

  it 'deve deletar uma situação' do
    sign_in_as_admin(admin)

    visit situations_path

    expect(page).to have_text(situation.nome)

    click_on "destroy_situation_#{situation.id}"

    expect(page).to have_text('Situação removida com sucesso')
  end

end
