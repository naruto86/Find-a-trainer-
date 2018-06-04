# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

p 'Creating users....'
10.times do
user = User.new(
first_name:  Faker::Name.first_name,
last_name:  Faker::Name.last_name,
age:  rand(16...80),
gender:    ['female', 'male'].sample,
email:    Faker::Internet.email,
password: Faker::Internet.password(8),
address:  Faker::Address.full_address
)
user.save!
end

p 'Creating reviews'
10.times do
  review = Review.new(
  title:   ['excellent', 'very good','good','average','not good'].sample,
  content:   ['excellent trainer and a nice person', 'very good I had a great workout','was not too bad','average trainer','do not use this guy'].sample
    )
  review.save!

end
p 'Creating expertises'
10.times do
  expertise = Expertise.new(
  name:   ['aerobics ', 'swimming','body building','yoga','weight loss','physical recovery'].sample,
  difficulty_level:  rand(1...5)

    )
  expertise.save!
end
p 'creating trainers'
 current_user_id = 0
 current_expertise_id = 0
10.times do
  current_user_id = current_user_id + 1
  current_expertise_id = current_expertise_id +1
  trainer = Trainer.new(
  user_id:   current_user_id,
  expertise_id:    current_expertise_id,
  hourly_rate:   rand(100...300)

    )
  trainer.save!
  end
