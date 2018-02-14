# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Cleaning database...'
Restaurant.destroy_all



puts 'Creating restaurants...'
restaurants_attributes = []


10.times do
  data = {
    name:         Faker::Company.name,
    address:      Faker::Address.street_address + ", " + Faker::Address.city,
    phone_number:  Faker::PhoneNumber.phone_number,
    category:        ["chinese","italian","japanese","french","belgian"].sample
  }
  res = Restaurant.create(data)
  res.save

  5.times do
    review_data = {
      content: Faker::Lorem.sentence,
      rating: [0,1,2,3,4,5].sample,
      restaurant: res,
    }
    review = Review.new(review_data)
    review.save
  end
end

puts 'Finished!'
