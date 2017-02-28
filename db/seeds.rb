# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless User.find_by(email: "alan@example.com")
  User.create(first_name: "Alan", last_name: "Admin", email: "alan@example.com", password: "password", phone: "+15555555555", admin: true)
end
