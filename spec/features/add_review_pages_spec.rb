require "rails_helper"

describe "the add an review process as an admin" do
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

  describe "the add an review process" do
    before :each do
      visit new_product_path
      fill_in "Name", with: "Wide Noodles"
      fill_in "Cost", with: "56"
      select "United States of America", from: "product_country_of_orgin"
      click_on "Create Product"
    end

    it "adds a new review as an admin" do
      click_link "Wide Noodles", match: :first
      click_link "Add a review"
      fill_in "Author", with: "Donkey Kong"
      fill_in "Content body", with: "Debitis excepturi quos nulla qui. Debitis excepturi quos nulla qui.Debitis excepturi quos nulla qui."
      fill_in "Rating", with: 3
      click_on "Create Review"
      expect(page).to have_content "Wide Noodles"
    end

    it "gives an error when a field is missing as an admin" do
      click_link "Wide Noodles", match: :first
      click_link "Add a review"
      fill_in "Author", with: ""
      click_on "Create Review"
      expect(page).to have_content "Oops..looks like there was an error in creating your review. Try again."
    end
  end
end

describe "the add an review process as a user" do
  before :each do
    visit new_user_registration_path
    fill_in "First name", with: "Jake"
    fill_in "Last name", with: "The Dog"
    fill_in "user_email", with: "user@gomail.com"
    fill_in "Password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
  end

  describe "the add an review process" do
    before :each do
      product = Product.create!(name: "Waffle Sauce", cost: "56", country_of_orgin: "United States of America")
      visit new_product_path(product)
    end

    it "adds a new review as a user" do
      click_link "Waffle Sauce", match: :first
      click_link "Add a review"
      fill_in "Author", with: "Jake"
      fill_in "Content body", with: "Debitis excepturi quos nulla qui. Debitis excepturi quos nulla qui.Debitis excepturi quos nulla qui."
      fill_in "Rating", with: 3
      click_on "Create Review"
      expect(page).to have_content "Waffle Sauce"
    end

    it "gives an error when a field is missing as a user" do
      visit new_product_path
      click_link "Waffle Sauce", match: :first
      click_link "Add a review"
      fill_in "Author", with: ""
      click_on "Create Review"
      expect(page).to have_content "Oops..looks like there was an error in creating your review. Try again."
    end
  end
end
