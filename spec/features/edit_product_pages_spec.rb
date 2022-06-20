require "rails_helper"

describe "the edit a product process as an admin" do
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

  describe "the edit a product process" do
    before :each do
      visit new_product_path
      fill_in "Name", with: "Pizza Sauce", match: :first
      fill_in "Cost", with: "56"
      select "United States of America", from: "product_country_of_orgin"
      click_on "Create Product"
    end

    it "edits a product as an admin" do
      click_link "Pizza Sauce", match: :first
      click_link "Edit"
      fill_in "Name", with: "Buger Sauce"
      click_on "Update Product"
      expect(page).not_to have_content "Product successfully updated!"
    end

    it "gives an error when a field is missing" do
      click_link "Pizza Sauce", match: :first
      click_link "Edit"
      fill_in "Name", with: ""
      click_on "Update Product"
      expect(page).to have_content "Name can't be blank"
    end
  end
end

describe "sign up as a user" do
  before :each do
    visit new_user_registration_path
    fill_in "First name", with: "Jake"
    fill_in "Last name", with: "The Dog"
    fill_in "user_email", with: "user@gomail.com"
    fill_in "Password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
  end

  describe "the edit a product process as a user" do
    before :each do
      product = Product.create!(name: "Pizza Sauce", cost: "556", country_of_orgin: "United States of America")
      visit new_product_path(product)
    end

    it "denies a user from accessing the product page." do
      expect(page).to have_content "Sorry, you are not authorize to access this page."
    end
  end
end
