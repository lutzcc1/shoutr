# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


mewtwo = User.create!(username: 'mewtwo', email: 'mewtwo@gmail.com', password: 'contraseña')
puts "#{mewtwo.username} created"

telos = User.create!(username: 'telos', email: 'telos@gmail.com', password: 'contraseña')
puts "#{telos.username} created"

ganon = User.create!(username: 'ganon', email: 'ganondorf@gmail.com', password: 'contraseña')
puts "#{ganon.username} created"

Shout.create!(
    user: mewtwo,
    content: TextShout.create!(body: "I see now that the circumstances of one's birth are irrelevant. It is what you do with the gift of life that determines who you are")
)
puts "#{mewtwo.username} shout created"

Shout.create!(
    user: telos,
    content: TextShout.create!(body: "I was created by a 🌱")
)
puts "#{telos.username} shout created"

Shout.create!(
    user: ganon,
    content: TextShout.create!(body: "DORIYAHHHHH")
)
puts "#{ganon.username} shout created"
