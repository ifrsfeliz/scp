module FeatureMacros
  def sign_in_as_admin(admin)
    visit new_user_session_path

    fill_in 'Email',    with: admin.email
    fill_in 'Senha', with: admin.password

    click_button 'Log in'
  end
end
