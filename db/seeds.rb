
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Deleteing all data'
Booking.destroy_all
Car.destroy_all
User.destroy_all
puts 'Data deleted'
puts 'Creating Users, Cars and Bookings'
5.times do
  user = User.new(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    name: Faker::Name.name,
    password: '123456'
  )
  user.save!
  5.times do
    car = Car.new(
      make: Faker::Vehicle.manufacture,
      model: Faker::Vehicle.model,
      category: Faker::Vehicle.car_type,
      description: Faker::Lorem.paragraph(sentence_count: 2),
      rate: rand(150..500),
      user: user
    )
    car.save!
    5.times do
      booking = Booking.new(
        start_date: Faker::Date.between(from: 10.days.ago, to: Date.today) ,
        end_date: Faker::Date.between(from: Date.today + 1, to: 1.month.from_now),
        car: car,
        user: user
      )
      booking.save!
    end
  end
end
puts 'Finished!'
