# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Creating Flights"

10.times do |i|
	Flight.create(
		name: Faker::Name.name,
        source: Faker::Address.city,
        destination: Faker::Address.city,
        status: Faker::String.random
		)

	puts "Flight #{i+1} has been created.."
end