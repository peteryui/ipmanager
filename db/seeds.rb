# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

csv_text = File.read('IP_UTF82.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  List.create!(ip: row[2], category: row[3], user_name: row[4], mac_address: row[5], description: row[6], last_update_user: "Nelson")
end

create_users = for i in 1..2 do
  User.create!([email: "example#{i}@gmail.com", password: '12345678', password_confirmation: '12345678', is_admin: true])
  # puts "example#{i}@gmail.com user created"
end
