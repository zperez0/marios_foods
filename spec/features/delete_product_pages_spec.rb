require 'rails_helper'

describe "the delete a product process" do
  before :each do
    visit new_product_path
    fill_in 'Name', with: 'Cheese Sauce'
    fill_in 'Cost', with: '56'
    select 'United States of America', from: 'product_country_of_orgin'
    click_on 'Create Product'
end

  it "deletes a product" do
    click_link 'Cheese Sauce'
    click_link 'Delete'
    expect(page).not_to have_content "Product successfully deleted!"
  end
end