require 'faker'

if Rails.env == 'development'
  (1..10).each do |i|
    User.create(first_name: Faker::Name.name,
                last_name: Faker::Name.name,
                email: Faker::Internet.email,
                password: 'password',
                password_confirmation: 'password'
                )
  end
  (1..10).each do |i|
    title = Faker::Name.name
    body = Faker::Lorem.sentence
    user_id = User.all.sample.id
    Board.create(user_id: user_id, title: title, body: body)
  end
end