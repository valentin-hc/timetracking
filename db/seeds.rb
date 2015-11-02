# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Running seed file for destroying and creating new"

Project.destroy_all

puts "________________All Projects Destroyed_______________________"

(1..5).each do |i| 
	Project.create(title: "Ironhack number #{i}", description: "Iron description", priority: rand(1..3))
	Project.create(title: "Personal number #{i}", description: "Personal description", priority: rand(1..3))
	Project.create(title: "Unknown number #{i}", priority: rand(1..3))
end


#then rake db:seeds

#then rails c

