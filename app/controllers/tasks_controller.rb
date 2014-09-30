class TasksController < ApplicationController
	attr_accessor :completed
	before_filter :find_list
	respond_to :html, :xml, :js

	def create
	
	@task = @list.tasks.new(params.require(:task).permit(:name, :description))
	if @task.save
		
		redirect_to lists_url
end
end
def complete
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])
		@task.completed = true
		@task.save
		redirect_to lists_url
   
 end


def destroy
		
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])
		if @task.destroy
		
		redirect_to lists_url
end
end
private

def find_list
	@list = List.find(params[:list_id])
end
end
