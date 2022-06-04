Product.destroy_all

50.times do |index|
  product = Product.create!({name: Faker::Food.ingredient, country_of_orgin: Faker::Address.country , cost: Faker::Number.between(from: 0.99, to: 100000.99)})
  5.times do |index|
    Review.create!({author: Faker::Games::SuperMario.character, content_body: Faker::Lorem.paragraph_by_chars(number: 120), rating: Faker::Number.within(range: 1..5), product_id: product.id})
  end
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"