require 'rails_helper_features'

RSpec.feature 'Delete a user' do
  given!(:user)  { create :user }
  given!(:admin) { create :user, :with_admin }

  it 'Should delete a category' do
    sign_in_as_admin(admin)

    visit admin_users_path

    click_on "delete_user_#{user.id}"

    expect(page).to have_text('User deleted successfully')
  end

  context "when crazy admin tries to destroy himself" do
    it "is not authorized to do it" do
      sign_in_as_admin(admin)

      visit admin_users_path

      click_on "delete_user_#{admin.id}"

      expect(page).to have_text("You're not authorized to perform this action")
    end
  end

  context "given a non admin user" do
    it 'is not authorized to destroy a user' do
      sign_in_as_admin(user)

      visit admin_users_path

      click_on "delete_user_#{admin.id}"

      expect(page).to have_text("You're not authorized to perform this action")
    end
  end
end
