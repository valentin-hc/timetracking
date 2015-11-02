class Project < ActiveRecord::Base
	def self.iron_high_prority
		where("title like 'Ironhack%' AND priority = 3")
	end
	def self.low_priority
		where("priority < 3")
	end
	def self.personal
		where("title like 'Personal%'")
	end
	def self.clean_low_priority
		where(priority: 1).destroy_all
	end

end
