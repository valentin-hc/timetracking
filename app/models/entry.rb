class Entry < ActiveRecord::Base
	validates :project, presence: true #that check if there is an actual project related to the entry. Better than just checking if there is a proect_id which would pass even if you assign a project ID which doesnt send back to an actual project
	validates :hours, presence: true, numericality: true
	validates :minutes, presence: true, numericality: true
	validates :date, presence: true
	belongs_to :project
	# def self.total_minutes(project_id)
	# 	entries = where(project_id: project_id)
	# 	total = 0
	# 	entries.each do |entry|
	# 		total += entry.hours * 60 
	# 		total += entry.minutes
	# 	end
	# 	Time.at(total*60).utc.strftime("%H hours and %M minutes")
	# end
	def total_minutes
		hours * 60 + minutes
	end
end
