class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :country_of_orgin, presence: true
  validates :cost, presence: true
  validates_numericality_of :cost, greater_than: 0, less_than_or_equal_to: 100000.99
  validates_length_of :name, minimum: 3, maximum: 50
  before_save :titleize_product

  scope :most_recent, -> { order(created_at: :desc).limit(3) }
  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}
  scope :local_product, -> { where(country_of_orgin: "United States of America") }
  scope :search, -> (name) { where("lower(name) LIKE ?", "%#{name.downcase}%")}

  LIST_OF_COUNTRIES = [
    "United States of America",
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua",
    "Argentina",
    "Armenia",
    "Australia",
    "Austria",
    "Bahamas",
    "Bangladesh",
    "Barbados",
    "Bolivia",
    "Brazil",
    "Canada",
    "Chile",
    "China",
    "Colombia",
    "Costa Rica",
    "Cuba",
    "Denmark",
    "Dominican Republic",
    "Ecuador",
    "Egypt",
    "El Salvador",
    "Germany",
    "Greece",
    "Haiti",
    "Iceland",
    "India",
    "Jamaica",
    "Japan",
    "Mexico",
    "North Korea",
    "Puerto Rico"
  ]

  private
    def titleize_product
    self.name = self.name.titleize
    end
end