require 'rails_helper_features'

RSpec.feature 'Deve mostrar o tipo de bolsa' do
  given!(:admin) { create :user, :as_admin }
  given!(:scholarship_type) { create :scholarship_type }

  it 'Deve mostrar um tipo de bolsa' do
    sign_in_as_admin(admin)

    visit scholarship_types_path

    click_on "show_scholarship_type_#{scholarship_type.id}"

    expect(page).to have_text('Exibindo Tipo de Bolsa')
    expect(page).to have_text(scholarship_type.nome)
  end

end
