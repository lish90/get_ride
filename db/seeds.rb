
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Deleteing all data'
Review.destroy_all
Booking.destroy_all
Car.destroy_all
User.destroy_all
puts 'Data deleted'
puts 'Creating Users, Cars, Reviews and Bookings'
images_url =['https://res.cloudinary.com/lish90code/image/upload/v1565619650/car/redfiat_bv4kv7.jpg',
             'https://res.cloudinary.com/lish90code/image/upload/v1565646598/car/grey_car_jwe7pq.jpg',
             'https://res.cloudinary.com/lish90code/image/upload/v1565646550/car/yellow_car_whfvaw.jpg',
             'https://res.cloudinary.com/lish90code/image/upload/v1565646515/car/campvan_dd0puj.jpg',
             'https://res.cloudinary.com/lish90code/image/upload/v1565619371/car/bluebnw_cgigtk.jpg']
5.times do
  user = User.new(
    email: Faker::Internet.email,
    username: Faker::Internet.username,
    name: Faker::Name.name,
    password: '123456'
  )
  user.save!
  counter = 0
  5.times do
    car = Car.new(
      make: Faker::Vehicle.manufacture,
      model: Faker::Vehicle.model,
      category: Faker::Vehicle.car_type,
      description: Faker::Lorem.paragraph(sentence_count: 2),
      rate: rand(150..500),
      user: user
    )

    car.remote_photo_url = images_url[counter]
    counter += 1

    car.save!
    5.times do
      booking = Booking.new(
        start_date: Faker::Date.between(from: 10.days.ago, to: Date.today) ,
        end_date: Faker::Date.between(from: Date.today + 1, to: 1.month.from_now),
        car: car,
        user: user
      )
      booking.save!
      1.times do
        review = Review.new(
          title: Faker::Lorem.sentence(word_count: 3),
          details: Faker::Lorem.paragraph(sentence_count: 2),
          rating: rand(1..5),
          review_date: Faker::Date.between(from: 100.days.ago, to: Date.today),
          car: car,
          user: user
        )
        review.save!
      end
    end
  end
end
puts 'Finished!'
