require 'rails_helper'

describe Product do
  it { should have_many :reviews }
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_most(50) }
  it { should validate_length_of(:name).is_at_least(3) }
  it { should validate_presence_of :country_of_orgin }
  it { should validate_presence_of :cost }
  it { should validate_numericality_of(:cost).is_greater_than(0) }
  it { should validate_numericality_of(:cost).is_less_than_or_equal_to(100000.99) }
end

describe Product do
  it("titleizes the name of a product")do
    product = Product.create!({name: "cheese sauce", country_of_orgin: "france", cost: 10.99 })
    expect(product.name).to eq "Cheese Sauce"
  end
end