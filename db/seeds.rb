# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
Tag.destroy_all
Message.destroy_all
Img.destroy_all
Usertag.destroy_all
Eventtag.destroy_all
Group.destroy_all



5.times do
User.create(name: Faker::Name.name, email: Faker::Name.first_name + "@gmail.com", dob: rand(1..1000), loc: Faker::Address.state, admin: [true, false].sample, password: Faker::Name.name)
end

5.times do
    Event.create(name: Faker::TvShows::GameOfThrones.house, time: rand(1..100), loc: Faker::Address.city)
end

5.times do
    Tag.create(main_tag: Faker::Food.dish)
end

5.times do
    Group.create(event_id: rand(1..5), user_id: rand(1..5), number: rand(1..10))
end

5.times do
    Usertag.create(tag_id: rand(1..5), user_id: rand(1..5))
end

5.times do
    Eventtag.create(event_id: rand(1..5), tag_id: rand(1..5))
end