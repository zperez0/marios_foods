require 'rails_helper'

describe "the delete an review process" do
  before :each do
    visit root_path
    click_link 'Create new product'
    fill_in 'Name', with: 'Cheese Sauce'
    fill_in 'Cost', with: '56'
    select 'United States of America', from: 'product_country_of_orgin'
    click_on 'Create Product'
  end

  it "deletes a review" do
    click_link 'Cheese Sauce'
    click_link 'Add a review'
    fill_in 'Author', with: 'big mac'
    fill_in 'Content body', with: "Debitis excepturi quos nulla qui. Debitis excepturi quos nulla qui."
    fill_in 'Rating', with: 3
    click_on 'Create Review'
    click_link 'big mac'
    click_link 'Delete review'
    expect(page).not_to have_content "Review successfully deleted!"
  end
end