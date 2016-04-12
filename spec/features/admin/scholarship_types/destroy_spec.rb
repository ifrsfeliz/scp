require 'rails_helper_features'

RSpec.feature 'Deleta um tipo de bolsa' do
  given!(:admin) { create :user, :as_admin }
  given!(:scholarship_type) { create :scholarship_type }

  it 'deve deletar um tipo de bolsa' do
    sign_in_as_admin(admin)

    visit scholarship_types_path

    expect(page).to have_text(scholarship_type.nome)

    click_on "destroy_scholarship_type_#{scholarship_type.id}"

    expect(page).to have_text('Tipo de Bolsa removido com sucesso')
  end

end
