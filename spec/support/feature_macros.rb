module FeatureMacros
  def sign_in_as_admin(admin)
    visit new_user_session_path
    fill_in 'user[email]',    with: admin.email
    fill_in 'user[password]', with: admin.password

    click_button 'Log in'
  end
end
