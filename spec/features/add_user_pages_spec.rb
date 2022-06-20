require "rails_helper"

describe "the user registration process" do
  it("allows a user to sign up") do
    visit new_user_registration_path
    click_on "Sign up"
    fill_in "First name", with: "Jake"
    fill_in "Last name", with: "The Dog"
    fill_in "user_email", with: "user@gomail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
    expect(page).not_to have_content "error."
  end

  it("allows a user to login") do
    User.create!(email: "user@gomail.com", password: "password123")
    visit new_user_session_path
    click_on "Login"
    fill_in "user_email", with: "user@gomail.com"
    fill_in "Password", with: "password123"
    click_on "Login"
    expect(page).not_to have_content "Invalid Email or password."
  end

  it("allows a user to logout") do
    User.create!(email: "user@gomail.com", password: "password123")
    visit destroy_user_session_path
    expect(page).not_to have_content "error."
  end
end

describe "allows a user to become an admin" do
  it("allows a user to sign up as an admin") do
    visit new_user_registration_path
    click_on "Sign Up"
    fill_in "First name", with: "Hot"
    fill_in "Last name", with: "Pancake"
    fill_in "user_email", with: "hotpancake@gomail.com"
    fill_in "user_password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_on "Sign up"
    User.where(email: "hotpancake@gomail.com").update(admin: true)
  end

  it("allows an admin to login") do
    User.create!(email: "hotpancake@gomail.com", password: "password123", admin: true)
    visit new_user_session_path
    click_on "Login"
    fill_in "user_email", with: "hotpancake@gomail.com"
    fill_in "Password", with: "password123"
    click_on "Login"
    expect(page).not_to have_content "Invalid Email or password."
  end

  it("allows an admin to logout") do
    User.create!(email: "hotpancake@gomail.com", password: "password123", admin: true)
    visit destroy_user_session_path
    expect(page).not_to have_content "error."
  end
end