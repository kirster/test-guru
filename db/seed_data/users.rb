#10.times { User.create!(email: Faker::Internet.email, full_name: Faker::Name.name) }