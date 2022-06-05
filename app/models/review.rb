class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true
  validates :rating, presence: true
  validates_numericality_of :rating, only_integer: true, greater_than: 0, less_than_or_equal_to: 5
  validates_length_of :content_body, minimum: 50, maximum: 250
end