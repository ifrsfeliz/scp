require 'rails_helper_features'

RSpec.feature 'Show a user' do
  given!(:role_admin) { create :role, :admin }
  given!(:role_comum) { create :role }
  given!(:admin) { create :user, :as_admin }

  it 'Deve mostrar um usuario' do
    sign_in_as_admin(admin)

    visit users_path

    click_on "show_#{admin.id}"

    expect(page).to have_text(admin.email)
  end

end
