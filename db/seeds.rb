# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning DB"
Ride.destroy_all

puts "Seeding"

theo = User.create(password: "123456", first_name: 'theo', last_name: 'thib', email: 'tt@gmail.com', description: "gentil garçon", car_owner: true, gearbox: "manual", car_owner_info: "125673839", driving_licence: false, driving_licence_info: "14363783")

ride1 = Ride.new(description: "Paris-Marseille", car_type: "twingo", owner_presence: false, seats_available: [1, 2, 3, 4].sample)
ride1.user = User.last
ride1.save

ride2 = Ride.new(description: "Retour des Sables d'Olonne", car_type: "espace", owner_presence: true, seats_available: [1, 2, 3, 4].sample)
ride2.user = User.last
ride2.save

ride3 = Ride.new(description: "AR pour Versailles", car_type: "", owner_presence: true, seats_available: [1, 2, 3, 4].sample)
ride3.user = User.last
ride3.save

ride4 = Ride.new(description: "Aider un papi qui s'est fait opérer", car_type: "ferrari", owner_presence: false, seats_available: [1, 2, 3, 4].sample)
ride4.user = User.last
ride4.save

ride5 = Ride.new(description: "Trajet pour Normandie", car_type: "citadine", owner_presence: true, seats_available: [1, 2, 3, 4].sample)
ride5.user = User.last
ride5.save

puts "Seeded"
