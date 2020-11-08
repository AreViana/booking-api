# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create(
  email: 'are@example.com',
  name: 'Arely Viana',
  password: 'are_vn',
  role: 'admin'
)

user = User.create(
  email: 'fer@example.com',
  name: 'Fernando',
  password: 'fernny',
  role: 'user'
)

activity = Activity.create(
  name: 'Dance class',
  kind: 'indoor'
)

Activity.create(
  name: 'Yoga class',
  kind: 'outdoor'
)

Activity.create(
  name: 'Cooking class',
  kind: 'online'
)

schedule = activity.schedules.create(
  place: 'Sivar',
  date: DateTime.tomorrow,
  owner_id: admin.id
)

schedule.bookings.create(
  user: user,
  ticket: SecureRandom.hex(10)
)

puts 'The following records were created:'
puts "#{User.count} users"
puts "#{Activity.count} activities"
puts "#{Schedule.count} schedule"
puts "#{Booking.count} booking"
