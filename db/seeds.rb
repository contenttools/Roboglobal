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


pages = ['home', 'about_us', 'legal_information', 'us_index', 'eu_index', 'disclaimer']
pages.each do |page|
  Page.where(title: page).first_or_create
end
puts 'Pages created'

PAGE_EMBED_ROLES = [['embed_video_on_home', 'Home Video'], ['embed_stock_chart_on_home_1', 'Home Stock Chart 1'], ['embed_stock_chart_on_home_2', 'Home Stock Chart 2'], ['embed_stock_chart_on_home_3', 'Home Stock Chart 3'], ['embed_video_on_robo_news', 'Robo News Video'], ['twitter_widget', 'Twitter Widget'], ['stock_picking_challenge', 'Stock Picking Challenge']]

PAGE_EMBED_ROLES.each do |page_embed_object|
  PageEmbed.where(role: page_embed_object[0]).first_or_create do |page_embed|
    page_embed.title = page_embed_object[1]
  end
end
puts 'Page Embeds created.'
