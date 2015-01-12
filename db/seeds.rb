# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'

user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'Berlin$123', :password_confirmation => 'Berlin123'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'Berlin$123', :password_confirmation => 'Berlin123'
puts 'New user created: ' << user2.name

#Studios
studio1 = User.create! :name => 'Studio1', :email => 'studio1@example.com', :password => 'Berlin$123', :password_confirmation => 'Berlin123'
puts 'New studio created: ' << studio1.name

#Studios
studio2 = User.create! :name => 'Studio2', :email => 'studio2@example.com', :password => 'Berlin$123', :password_confirmation => 'Berlin123'
puts 'New studio created: ' << studio2.name


