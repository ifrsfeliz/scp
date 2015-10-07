# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
['admin', 'comum'].each do |role|
  Role.find_or_create_by({name: role})
  puts "Role #{role} was created."
end

u = User.new(:email => "sti@feliz.ifrs.edu.br", :password => '12345678', :password_confirmation => '12345678')
u.save

puts u

if u
  u.admin_authorization = true
  u.save
  u.roles << Role.find_by_name('admin')
end
