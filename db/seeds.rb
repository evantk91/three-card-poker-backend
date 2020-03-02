# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Score.destroy_all

user1 = User.create(username: "Evan", password: "shadow")

score1 = Score.create(user: user1, score: 1200)
score2 = Score.create(user: user1, score: 2000)
