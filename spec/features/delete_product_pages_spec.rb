require "rails_helper"

describe "the delete a product process as an admin" do
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

  describe "deletes a product process as an admin" do
    before :each do
      visit new_product_path
      fill_in "Name", with: "Maple Syrup"
      fill_in "Cost", with: "56"
      select "United States of America", from: "product_country_of_orgin"
      click_on "Create Product"
    end

    it "deletes a product" do
      click_link "Maple Syrup", match: :first
      click_link "Delete"
      expect(page).not_to have_content "Product successfully deleted!"
    end
  end
end

describe "the delete a product process as a user" do
  before :each do
    visit new_user_registration_path
    fill_in "First name", with: "Jake"
    fill_in "Last name", with: "The Dog"
    fill_in "user_email", with: "user@gomail.com"
    fill_in "Password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
  end

  it "denies a user from accessing the product page." do
    visit new_product_path
    expect(page).to have_content "Sorry, you are not authorize to access this page."
  end
end