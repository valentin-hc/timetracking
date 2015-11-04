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
end


puts "Destroying all entries for all projects"

Entry.destroy_all 

puts "________________All Entries Destroyed_______________________"

Project.all.each do |p|
	(1..5).each do |i|
		p.entries.create(hours: rand(1..3), minutes: rand(1..60), comments: "random comment", date: rand(Date.new(2015,10,20)..Date.today))
	end
end


#then rake db:seeds

#then rails c

#Llorenç's way

# Project.destroy_all
# Entry.destroy_all

# (1..5).each do |i| 
# 	iron_project = Project.create(title: "Ironhack number #{i}", description: "Iron description", priority: rand(1..3))
# 	personal_project = Project.create(title: "Personal number #{i}", description: "Personal description", priority: rand(1..3))
# 	(1..3).each do |h|
# 		iron_project.entries.create({
# 			hours: h,
# 			minutes: h * 15,
# 			date: rand(Date.new(2015,10,1)..Date.today)
# 			comment: "Any repeated comment"
# 			})
# 		personal_project.entries.create({
# 			hours: h,
# 			minutes: h * 15,
# 			date: rand(Date.new(2015,10,1)..Date.today)
# 			comment: "Any repeated comment"
# 			})
# 	end

# end
