class DivisionsController < ApplicationController

	layout 'division'


	def index
		@data = Division.all
	end


	def add
		@division = Division.new
		if request.post? then
			@division = Division.create division_params
			redirect_to '/division'
		end
	end


	def edit
		@division = Division.find params[:id]
		if request.patch? then
			@division.update division_params
			redirect_to '/division'
		end
	end


	private
	def division_params
		params.require(:division).permit(:name)
	end


end