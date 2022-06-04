require 'rails_helper'

describe "the delete a product process" do
  before :each do
    visit root_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Cheese Sauce'
    fill_in 'Cost', :with => '56'
    select 'United States of America', :from => 'product_country_of_orgin'
    click_on 'Create Product'
end

  it "deletes a product" do
    click_link 'Cheese Sauce'
    click_link 'Delete'
    expect(page).to have_no_content 'Cheese Sauce'
    expect(page).to have_content "Product successfully deleted!"
  end
end