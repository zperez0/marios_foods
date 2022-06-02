class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :country_of_orgin, presence: true
  validates :cost, presence: true
  validates_numericality_of :cost, greater_than: 0, less_than_or_equal_to: 100000.99
  validates_length_of :name, minimum: 3, maximum: 50
  before_save :titleize_product

# add scope

# add search?

  private
    def titleize_product
    self.name = self.name.titleize
    end
end