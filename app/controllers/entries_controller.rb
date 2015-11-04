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
		render template: "shared/error" if @project.nil?
	end


	def create
		project_id = params[:project_id]
		@project = Project.find_by(id: project_id)
		# @entry = @project.entries.new({
		# 	hours: params[:entry][:hours],
		# 	minutes: params[:entry][:minutes],
		# 	date: params[:entry][:date],
		# 	comments: params[:entry][:comments]
		# 	})
		@entry = @project.entries.new(entry_params)
		if @entry.save
			redirect_to project_entries_path(@project.id)
		else
			#@errors = @entry.errors.full_messages
			render "new"
		end
	end

	def edit
		@entry = Entry.find_by(id: params[:id])
		render template: "shared/error" if @entry.nil?
	end
	def update
		@entry = Entry.find_by(id: params[:id])
		if @entry.update(entry_params)
			redirect_to project_entries_path(@entry.project_id)
		else
			render "edit"
		end
	end

	private

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date, :comments)
	end
end
