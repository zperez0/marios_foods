require 'rails_helper'

describe "the edit a product process" do
  before :each do
    visit root_path
    click_link 'Create new product'
    fill_in 'Name', with: 'Cheese Sauce'
    fill_in 'Cost', with: '56'
    select 'United States of America', from: 'product_country_of_orgin'
    click_on 'Create Product'
  end

  it "edits a product" do
    click_link 'Cheese Sauce'
    click_link 'Edit'
    fill_in 'Name', with: 'Buger Sauce'
    click_on 'Update Product'
    expect(page).not_to have_content "Product successfully updated!"
  end

  it "gives an error when a field is missing" do
    click_link 'Cheese Sauce'
    click_link 'Edit'
    fill_in 'Name', with: ''
    click_on 'Update Product'
    expect(page).to have_content "Name can't be blank"
  end
end
