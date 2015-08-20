# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user =  User.where(email: 'admin@robostox.com').first_or_initialize
user.password = 'password'
user.save!
puts 'New Admin created: ' << user.email


pages = ['home', 'about_us', 'legal_information', 'us_index', 'eu_index']
pages.each do |page|
  Page.where(title: page).first_or_create
end
puts 'Pages created'
