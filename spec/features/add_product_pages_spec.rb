require "rails_helper"

describe "user registration" do
  before :each do
    user = User.create(:email => "hotpancake@gomail.com", :password => "password", :admin => true, :first_name => "hot", :last_name => "pancake")
    visit user_session
    fill_in 'email', :with => 'hotpancake@gomail.com'
    fill_in 'Password', :with => 'password!'
    click_button 'Sign in'
    expect(page).to have_content "Signed in successfully."
  end
end

describe "the add a product process" do
  it "adds a new product" do
    visit new_product_path
    fill_in "Name", :with => "Cheese Sauce"
    fill_in "Cost", :with => "56"
    select "United States of America", :from => "product_country_of_orgin"
    click_on "Create Product"
    expect(page).to have_content "Product successfully added!"
    expect(page).to have_content "Cheese Sauce"
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on "Create Product"
    expect(page).to have_content "Name can't be blank"
  end
end
