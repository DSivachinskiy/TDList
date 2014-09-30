class ListsController < ApplicationController
	
	respond_to :html, :xml, :js
	def index
		respond_with(@lists = List.all)
		
	end
	
	def new
		@list = List.new
	end
	def create
		@list = List.new(params.require(:list).permit(:name))
		if @list.save
		
		respond_with(@list, :location => lists_url)



	end
	end

	

	def edit
		@list = List.find(params[:id])
end
	def update
		@list = List.find(params[:id])
		if @list.update_attributes(params.require(:list).permit(:name))
		redirect_to lists_url
	
end
end
	def destroy
		@list = List.find(params[:id])
		if @list.destroy
		
		redirect_to lists_url
	else
		
		redirect_to lists_url
end
end
end
