module LoginHelper
  def login_as(email, password)
    visit '/users/sign_in'
    fill_in 'Email',     with: email
    fill_in 'Password',  with: password
    click_button 'Sign in'
  end
end
