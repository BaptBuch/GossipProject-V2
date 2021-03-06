# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all

10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end


10.times do
  cities_list = City.all
  User.create!(first_name: Faker::Superhero.name, last_name: Faker::Superhero.suffix, description: Faker::Hipster.sentence, email:Faker::Internet.email, age: Faker::Number.between(from: 18, to: 100), city: cities_list.sample)
end

20.times do
  u = User.all.sample
  gossip = Gossip.create(title: Faker::Movie.quote, content: Faker::Lorem.paragraph, user: u)
end