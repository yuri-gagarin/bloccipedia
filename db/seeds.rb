# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first
require 'faker'

10.times do
  user = User.new(email: Faker::Internet.email, password: 'topsecret')
  user.skip_confirmation!
  user.save!
end

admin_user = User.first
admin_user.update_attributes(email: 'ymivanov@icloud.com', password: 'password', access_level: 2)

users = User.all

5.times do
  Wiki.create!(
    title: Faker::Space.nebula,
    body: Faker::Lorem.paragraph(4),
    private: false,
    category: 'science',
    user_id: users.sample
  )
end

5.times do
  Wiki.create!(
    title: Faker::Music.instrument,
    body: Faker::Lorem.paragraph(6),
    private: false,
    category: 'general',
    user_id: users.sample
  )
end

5.times do
  Wiki.create!(
    title: Faker::Team.name,
    body: Faker::Lorem.paragraph(5),
    private: false,
    category: 'sports',
    user_id: users.sample
  )
end

5.times do
  Wiki.create!(
    title: Faker::Ancient.hero,
    body: Faker::Lorem.paragraph(7),
    private: false,
    category: 'history',
    user_id: users.sample
  )
end

5.times do
  Wiki.create!(
    title: Faker::University.name,
    body: Faker::Lorem.paragraph(4),
    private: false,
    category: 'education',
    user_id: users.sample
  )
end

puts 'Hello Admin'
puts "*****************"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"

puts "Your admin account is the following:"
puts "Email: #{admin_user.email}"
