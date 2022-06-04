require 'rails_helper'

describe "the add an review process" do
  before :each do
    visit root_path
    click_link 'Create new product'
    fill_in 'Name', with: 'Cheese Sauce'
    fill_in 'Cost', with: '56'
    select 'United States of America', from: 'product_country_of_orgin'
    click_on 'Create Product'
  end

  it "adds a new review" do
    click_link 'Cheese Sauce'
    click_link 'Add a review'
    fill_in 'Author', with: 'Donkey Kong'
    fill_in 'Content body', with: "Debitis excepturi quos nulla qui. Debitis excepturi quos nulla qui.Debitis excepturi quos nulla qui."
    fill_in 'Rating', with: 3
    click_on 'Create Review'
    expect(page).to have_content "Cheese Sauce"
  end

  it "gives an error when a field is missing" do
    click_link 'Cheese Sauce'
    click_link 'Add a review'
    fill_in 'Author', with: ''
    click_on 'Create Review'
    expect(page).to have_content "Oops..looks like there was an error in creating your review. Try again."
  end
end
