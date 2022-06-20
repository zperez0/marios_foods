require "rails_helper"

describe "the add a product process as an admin" do
  before :each do
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

  it "adds a new product as an admin" do
    visit new_product_path
    fill_in "Name", with: "Cheese Sauce"
    fill_in "Cost", with: "56"
    select "United States of America", from: "product_country_of_orgin"
    click_on "Create Product"
    expect(page).to have_content "Product successfully added!"
    expect(page).to have_content "Cheese Sauce"
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on "Create Product"
    expect(page).to have_content "Name can't be blank"
  end
end

describe "the add a product process as a user" do
  before :each do
    visit new_user_registration_path
    fill_in "First name", with: "Jake"
    fill_in "Last name", with: "The Dog"
    fill_in "user_email", with: "user@gomail.com"
    fill_in "Password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
  end

  it "denies a user from accessing the products page." do
    visit new_product_path
    expect(page).to have_content "Sorry, you are not authorize to access this page."
  end
end
