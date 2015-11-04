class Project < ActiveRecord::Base
	validates :title, uniqueness: true, presence: true, length: {maximum: 30}#, 
	validates :priority, presence: true, inclusion: {in: [1,2,3]}
	has_many :entries
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
	def total_time #no need for self since it will be called from a specific project inside our views
		entries.inject(0) do |acc, entry|
			acc + entry.total_minutes
		end
	end
end
