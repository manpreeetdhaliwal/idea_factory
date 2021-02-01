# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Idea.delete_all
100.times do
    created_at=Faker::Date.backward(days: 365*5)
   i=Idea.create(
       title: Faker::Hacker.say_something_smart,
       description: Faker::ChuckNorris.fact,
       
       created_at: created_at,
       updated_at: created_at)
end
idea=Idea.all
puts Cowsay.say("Generated #{idea.count} ideas.",:frogs)
