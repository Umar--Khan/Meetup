# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
User.create(name: Faker::Name.name, email: Faker::Name.first_name + "@gmail.com", dob: rand(1..1000), loc: Faker::Address.state, admin: [true, false].sample)
end

5.times do
    Event.create(name: Faker::TvShows::GameOfThrones.house, time: rand(1..100), loc: Faker::Address.city)
end

5.times do
    Tag.create(main_tag: Faker::Food.dish , sub_tag_01: Faker::Food.ingredient, sub_tag_02: Faker::Food.spice, event_id: rand(1..5), user_id: rand(1..5))
end

5.times do
    Group.create(event_id: rand(1..5), user_id: rand(1..5))
end