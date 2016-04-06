require 'rails_helper_features'

RSpec.feature 'Delete a user' do
  given!(:role_admin) { create :role, :admin }
  given!(:role_comum) { create :role }
  given!(:admin) { create :user, :as_admin }
  given!(:admin_not_authorized) { create :user, :as_admin, admin_authorization: false }

  it 'Should delete a category' do
    sign_in_as_admin(admin)

    visit users_path

    click_on "destroy_#{admin_not_authorized.id}"

    expect(page).to have_text('Usuário deletado com sucesso')
  end

end
