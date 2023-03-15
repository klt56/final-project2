require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times do
  Property.create(
    title: Faker::Address.street_address,
    description: Faker::Lorem.sentence(word_count: 10),
    price: Faker::Number.between(from: 100000, to: 1000000),
    city: Faker::Address.city,
    address: Faker::Address.full_address
  )
end
