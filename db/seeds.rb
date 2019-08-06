require "date"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Car.destroy_all
# User.destroy_?all

me = User.first
car = Car.create(make: "Ferrari", user: me)
car2 = Car.create(make: "Maserati", user: me)






Booking.create!(start_date: Date.today, end_date: Date.today + 5, user: me, car: car)
Booking.create!(start_date: Date.today, end_date: Date.today + 10, user: me, car: car2)
