require 'rails_helper_features'

RSpec.feature 'Show a user' do
  given!(:user)  { create :user }
  given!(:admin) { create :user, :with_admin }

  it 'Should show a category' do
    sign_in_as_admin(admin)

    visit admin_users_path

    click_on "show_user_#{user.id}"

    expect(page).to have_text("Email: #{user.email}")
  end

end
