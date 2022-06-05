require 'rails_helper'

describe "the edit a review process" do
  before :each do
    visit new_product_path
    fill_in 'Name', with: 'Cheese Sauce'
    fill_in 'Cost', with: '56'
    select 'United States of America', from: 'product_country_of_orgin'
    click_on 'Create Product'
  end

  it "edits a review" do
    click_link 'Cheese Sauce'
    click_link 'Add a review'
    fill_in 'Author', with: 'Donkey Kong'
    fill_in 'Content body', with: "Debitis excepturi quos nulla qui. Debitis excepturi quos nulla qui.Debitis excepturi quos nulla qui."
    fill_in 'Rating', with: 3
    click_on 'Create Review'
    click_link 'Donkey Kong'
    click_link 'Edit review'
    fill_in 'Author', with: 'Peach'
    click_on 'Update Review'
    expect(page).not_to have_content 'Review successfully updated!'
  end

  it "gives an error when a field is missing" do
    click_link 'Cheese Sauce'
    click_link 'Edit'
    fill_in 'Name', with: ''
    click_on 'Update Product'
    expect(page).to have_content "Name can't be blank"
  end
end
