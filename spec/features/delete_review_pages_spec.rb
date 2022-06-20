require "rails_helper"

describe "the delete a review proccess as an admin" do
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

  describe "the delete an review process" do
    before :each do
      visit new_product_path
      fill_in "Name", with: "Ginger"
      fill_in "Cost", with: "56"
      select "United States of America", from: "product_country_of_orgin"
      click_on "Create Product"
    end

    it "deletes a review as an admin" do
      click_link "Ginger"
      click_link "Add a review"
      fill_in "Author", with: "big mac"
      fill_in "Content body", with: "Debitis excepturi quos nulla qui. Debitis excepturi quos nulla qui."
      fill_in "Rating", with: 3
      click_on "Create Review"
      click_link "big mac"
      click_link "Delete review"
      expect(page).not_to have_content "Review successfully deleted!"
    end
  end
end

describe "the delete a review proccess as a user" do
  before :each do
    visit new_user_registration_path
    fill_in "First name", with: "Jake"
    fill_in "Last name", with: "The Dog"
    fill_in "user_email", with: "user@gomail.com"
    fill_in "Password", with: "password123"
    fill_in "user_password_confirmation", with: "password123"
    click_button "Sign up"
  end

  describe "the delete an review process" do
    before :each do
      product = Product.create!(name: "Waffle Sauce", cost: "56", country_of_orgin: "United States of America")
      review = Review.create!(author: "Donkey Kong", content_body: "Debitis excepturi quos nulla qui. Debitis excepturi quos nulla qui.Debitis excepturi quos nulla qui.", rating: 3, product_id: product.id)
      visit new_product_review_path(product, review)
    end

    it "denies a user from accessing the edit review page." do
      expect(page).not_to have_content "Delete review"
    end
  end
end
