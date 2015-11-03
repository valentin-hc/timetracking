class ProjectsController < ApplicationController
	def index
		@projects = Project.all#where("title like 'Iron%'")
	end
	def show
		@id = params[:id]
		@project = Project.find_by(id: @id)  #better than find cause if there is not it just returns nil
		render "no_project_found" if @project.nil?
	end
	def new
		@project = Project.new
	end
	def create
		Project.create({
			title: params[:project][:title],
			description: params[:project][:description],
			priority: params[:project][:priority],
			})
		redirect_to "/projects"
	end
end
