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

user = User.find_by_email('sti@feliz.ifrs.edu.br')

puts user

if user
  user.admin_authorization = true
  user.save
  user.roles << Role.find_by_name('admin')
end
