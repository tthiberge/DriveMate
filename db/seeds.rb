# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning DB"
Booking.destroy_all
Ride.destroy_all
User.destroy_all

puts "Seeding"

theo = User.create(password: "123456", first_name: 'theo', last_name: 'thib', email: 'tt@gmail.com', description: "gentil garçon", car_owner: true, gearbox: "manual", car_owner_info: "125673839", driving_licence: true, driving_licence_info: "14363783")

maung = User.create!(password: '123456', first_name: 'maung', last_name: 'petitfrère', email: 'maung@icloud.com', description: "lost my driving license", car_owner: true, gearbox: "manual", car_owner_info: "123433333", driving_licence: false, driving_licence_info: " ")

sara = User.create!(password: '123456', first_name: 'sara', last_name: 'beniche', email: 'sara_beniche@icloud.com', description: "recherche conductrice responsable", car_owner: false, gearbox: "manual", car_owner_info: "123455522", driving_licence: true, driving_licence_info: " ")

# car owners && drivers
diane = User.create!(password: '123456', first_name: 'diane', last_name: 'lesvenan', email: 'diane_lesvenan@icloud.com', description: "managing my grand pa's car", car_owner: true, gearbox: "automatic", car_owner_info: "123477777", driving_licence: true, driving_licence_info: "14363777")

joy = User.create!(password: '123456', first_name: 'joy', last_name: 'danenberg', email: 'joy@icloud.com', description: "broke my leg", car_owner: true, gearbox: "automatic", car_owner_info: "123455555", driving_licence: false, driving_licence_info: "14363555")

# drivers
laura = User.create!(password: '123456', first_name: 'laura', last_name: 'amazing', email: 'laura_amazing@icloud.com', description: "la pilote", car_owner: false, gearbox: "manual", car_owner_info: "123455544", driving_licence: true, driving_licence_info: "14363544")

leo = User.create!(password: '123456', first_name: 'leo', last_name: 'martin', email: 'leo_martin@icloud.com', description: "le pilote", car_owner: false, gearbox: "automatic", car_owner_info: "123455514", driving_licence: true, driving_licence_info: "14363514")

# rides
ride1 = Ride.new(description: "Paris-Marseille", car_type: "Renault Clio", owner_presence: false, seats_available: [1, 2, 3, 4].sample, date: Date.today + rand(30), departure_location: "Paris", arrival_location: "Marseille")
ride1.user = theo
ride1.save

ride2 = Ride.new(description: "Coming back from vacations, I have 1 suitcase in my car trunk", car_type: "Range Rover Evoque", owner_presence: true, seats_available: [1, 2, 3, 4].sample, date: Date.today + rand(30), departure_location: "Sables d'Olonne", arrival_location: "Reims")
ride2.user = diane
ride2.save

ride3 = Ride.new(description: "RTT for Versailles from Paris", car_type: "BMW Série 1 ", owner_presence: true, seats_available: [1, 2, 3, 4].sample, date: Date.today + rand(30), departure_location: "Versailles", arrival_location: "Versailles (via Paris)")
ride3.user = maung
ride3.save

ride4 = Ride.new(description: "Help an old man to go to La Vallée Village", car_type: "Mercedes Classe C", owner_presence: false, seats_available: [1, 2, 3, 4].sample, date: Date.today + rand(30), departure_location: "Paris", arrival_location: "La Vallée Village")
ride4.user = joy
ride4.save

ride5 = Ride.new(description: "Trajet quotidien Etiolles/Levallois en passant par Paris", car_type: "MINI Countryman", owner_presence: false, seats_available: [1, 2, 3, 4].sample, date: Date.today + rand(30), departure_location: "Etiolles", arrival_location: "Levallois")
ride5.user = sara
ride5.save

# bookings with user id && ride id && comment
booking1 = Booking.new
booking1.user = diane
booking1.ride = ride1
booking1.comment = "Can't wait to see my friends in Marseille!"
booking1.save!

booking1bis = Booking.new
booking1bis.user = laura
booking1bis.ride = ride1
booking1bis.comment = "I'm going to Cassis for the weekend, Marseille is my first step to get there!"
booking1bis.save!

booking1ter = Booking.new
booking1ter.user = leo
booking1ter.ride = ride1
booking1ter.comment = "I am visiting family"
# booking1ter.status = "Confirmed"
booking1ter.save!

booking2 = Booking.new
booking2.user = theo
booking2.ride = ride2
booking2.comment = "I'm going home"
booking2.save

booking3 = Booking.new
booking3.user = maung
booking3.ride = ride3
booking3.comment = "Let's go to work together"
booking3.save

booking3bis = Booking.new
booking3bis.user = theo
booking3bis.ride = ride3
booking3bis.comment = "I'm goint to visit the Versailles castle "
booking3bis.status = "Declined"
booking3bis.save

booking4 = Booking.new
booking4.user = joy
booking4.ride = ride4
booking4.comment = "Happy to help, Happy You help me"
booking4.save

booking4bis = Booking.new
booking4bis.user = theo
booking4bis.ride = ride4
booking4bis.comment = "Happy to help You, Happy You help me, I am a meticulous driver"
booking4bis.status = "Confirmed"
booking4bis.save

booking5 = Booking.new
booking5.user = leo
booking5.ride = ride5
booking5.comment = "Let's commute together"
booking5.save

puts "Seeded"

require 'faker'
Faker::LoremFlickr.image(size: "800x800", search_terms: ['landscape']) #=> "https://loremflickr.com/800/800/landscape"

Faker::Images::Landscapes
