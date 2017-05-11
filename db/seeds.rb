User.create!(email: "eliseb@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar")

40.times do |n|
  email = "eliseb-#{n+1}@gmail.com"
  password = "password"
  User.create!(email: email,
              password:              password,
              password_confirmation: password)
end 

# Men_pages 
users = User.order(:created_at).take(6)
30.times do
  name = Faker::Name.name 
  description = Faker::Lorem.sentence(5)
  users.each { |user| user.men.create!(name: name, description: description) }
end