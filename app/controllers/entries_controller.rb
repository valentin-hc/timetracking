class EntriesController < ApplicationController
	def index
		@project = Project.find_by(id: params[:project_id])
		if @project.nil?
			render template: "shared/error"
		else
			@entries = @project.entries
		end
	end
	def new
		@project = Project.find_by(id: params[:project_id])
		@entry = Entry.new
		#@entry = @project.entries.new
	end
	def create
		project_id = params[:project_id]
		project = Project.find_by(id: project_id)
		entry = project.entries.new({
			hours: params[:entry][:hours],
			minutes: params[:entry][:minutes],
			date: params[:entry][:date],
			comments: params[:entry][:comments]
			})
		entry.save
		redirect_to "/projects/#{project_id}/entries"
	end
	# def create
	# 	entry = Entry.new
	# 	if entry.save
	# 		redirect_to
	# 	else
	# 		@errors = entry.errors.full_messages
	# 		render "new"
	# 	end
	# end
end
