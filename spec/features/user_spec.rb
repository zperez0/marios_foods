require 'rails_helper'

describe 'User registration' do
  it 'allows a user to register' do
    visit new_user_registration_path
    fill_in 'First name', :with => 'Hot'
    fill_in 'Last name', :with => 'Pancake'
    fill_in 'Email', :with => 'hotpancake@gomail.com'
    fill_in 'Password', :with => 'password123'
    fill_in 'Password Confirmation', :with => 'password123'
    click_button 'Sign up'
    page.should have content 'Welcome! You have signed up successfully.'
  end
end