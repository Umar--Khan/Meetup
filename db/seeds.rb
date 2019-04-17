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


User.create(name: "test", email: Faker::Name.first_name + "@gmail.com", dob: rand(1..1000), loc: Faker::Address.state, admin: [true, false].sample, password: "pass")

4.times do
User.create(name: Faker::Name.name, email: Faker::Name.first_name + "@gmail.com", dob: rand(1..1000), loc: Faker::Address.state, admin: [true, false].sample, password: "pass")
end

5.times do
    Event.create(name: Faker::TvShows::GameOfThrones.house, time: Time.new(2002, 10, 31, 2, 2, 2), loc: Faker::Address.city)
end

5.times do
    Tag.create(main_tag: Faker::Food.dish)
end


Img.create(url: Faker::Food.dish, event_id: 1)
Img.create(url: Faker::Food.dish, event_id: 2)
Img.create(url: Faker::Food.dish, event_id: 3)
Img.create(url: Faker::Food.dish, event_id: 4)
Img.create(url: Faker::Food.dish, event_id: 5)



5.times do
    Group.create(event_id: rand(1..5), user_id: rand(2..5), number: rand(1..10))
end

5.times do
    Usertag.create(tag_id: rand(1..5), user_id: rand(1..5))
end

5.times do
    Eventtag.create(event_id: rand(1..5), tag_id: rand(1..5))
end

Message.create(content: Faker::Food.dish, event_id: 1)
Message.create(content: Faker::Food.dish, event_id: 2)
Message.create(content: Faker::Food.dish, event_id: 3)
Message.create(content: Faker::Food.dish, event_id: 4)
Message.create(content: Faker::Food.dish, event_id: 5)
