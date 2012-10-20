# encoding: utf-8
require 'acceptance/acceptance_helper'

feature 'Dashboard', %q{
  In order to be able to get an overview of the system
  As a logged-in user
  I want to be able to see the homepage
} do

  background do
    @user = create(:user)
  end

  scenario 'Dashboard' do
    speak_english!
    login_as @user.email, @user.password

    page.should have_content 'Der MuseumDienst Hamburg'
  end

end
