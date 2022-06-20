Product.destroy_all
User.destroy_all

45.times do |index|
  product = Product.create!({ name: Faker::Food.ingredient, country_of_orgin: Faker::Address.country, cost: Faker::Number.between(from: 0.99, to: 100000.99) })
  5.times do |index|
    Review.create!({ author: Faker::Games::SuperMario.character, content_body: Faker::Lorem.paragraph_by_chars(number: 120), rating: Faker::Number.within(range: 1..5), product_id: product.id })
  end
end

5.times do |index|
  product_usa = Product.create!({ name: Faker::Food.ingredient, country_of_orgin: "United States of America", cost: Faker::Number.between(from: 0.99, to: 100000.99) })
  5.times do |index|
    Review.create!({ author: Faker::Games::SuperMario.character, content_body: Faker::Lorem.paragraph_by_chars(number: 120), rating: Faker::Number.within(range: 1..5), product_id: product_usa.id })
  end
end

1.times do |index|
  User.create!({ email: Faker::Internet.email(name: Faker::Games::SuperMario.character), password: "password", first_name: Faker::Games::SuperMario.character, last_name: Faker::Name.last_name, bio: Faker::Lorem.paragraph_by_chars(number: 120) })
end

1.times do |index|
  User.create!({ email: "hotwaffle@gomail.com", password: "password", first_name: Faker::Games::SuperMario.character, last_name: Faker::Name.last_name, bio: Faker::Lorem.paragraph_by_chars(number: 120), admin: true })
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
p "Created #{User.count} users"
