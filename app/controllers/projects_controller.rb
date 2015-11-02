class ProjectsController < ApplicationController
	def index
		@projects = Project.all#where("title like 'Iron%'")
	end
	def show
		@id = params[:id]
		@project = Project.find_by(id: @id)  #better than find cause if there is not it just returns nil
		if @project.nil?
			render "no_project_found"
		end
	end
end
