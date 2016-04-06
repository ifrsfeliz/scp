require 'rails_helper_features'

RSpec.feature 'Edit users' do
  given!(:user)  { create :user }
  given!(:admin) { create :user, :with_admin }

  it 'edits a user with valid data' do
    sign_in_as_admin(admin)

    visit admin_user_path(user)

    click_link 'Edit User'

    expect(current_path).to eq(edit_admin_user_path(user))

    fill_in 'user_email', with: 'someone@quezmedia.com'
    fill_in 'user_password', with: '12341234'
    select 'admin', from: 'user_role_ids'

    click_on 'Update User'
    expect(current_path).to eq(admin_users_path)
    expect(page).to have_text('User updated successfully')
  end

  it 'renders "edit" with invalid data' do
    sign_in_as_admin(admin)

    visit admin_user_path(user)

    click_link 'Edit User'

    expect(current_path).to eq(edit_admin_user_path(user))

    fill_in 'user_email', with: ''
    fill_in 'user_password', with: ''

    click_button 'Update User'
    expect(current_path).to eq(admin_user_path(user))
    expect(page).to_not have_text('User updated successfully')
    expect(page).to have_text("can't be blank")
  end

  context "given a non admin user" do
    it 'is not authorized to edit a user' do
      sign_in_as_admin(user)

      visit admin_user_path(user)

      click_link 'Edit User'

      expect(current_path).to eq(admin_user_path(user))
      expect(page).to have_text("You're not authorized to perform this action")
    end
  end
end
