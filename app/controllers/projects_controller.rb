class ProjectsController < ApplicationController
	def index
		@projects = Project.all#where("title like 'Iron%'")
		#@projects = Project.where(title: "bob")
		render template: "shared/error" if @projects.empty?
	end
	def show
		@id = params[:id]
		@project = Project.find_by(id: @id)  #better than find cause if there is not it just returns nil
		#render "no_project_found" if @project.nil?
		render template: "shared/error" if @project.nil?		
	end
	def new
		@project = Project.new
	end
	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to "/projects"
		else
			render "new"
		end
	end

	def edit
		@project = Project.find_by(id: params[:id])
	end
	def update
		@project = Project.find_by(id: params[:id])
		if @project.update(project_params)
			redirect_to project_path(@project.id)
		else
			render "edit"
		end
	end

	private
	def project_params
		params.require(:project).permit(:title, :description, :priority)
	end
end
