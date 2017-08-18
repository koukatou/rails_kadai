class ReportsController < ApplicationController
	layout 'report'
	PER = 10

	def index
		page_size = 10
		@page_num = 0
		if params[:page] != nil then
			@page_num = params[:page].to_i 
		end
		@data = Report.all.order('created_at desc')
			.offset(page_size * @page_num)
			.limit(page_size)
			# @allpage = Report.page(params[:page]).per(PER)

			if request.post? then
			f = params[:date]
			g = params[:date2]
			h = '%' + params[:find] + '%'
				@data = Report.joins(:user).where("entry_date >= ? and entry_date <= ? and users.name like ?" , f, g, h).order 'user_id asc, entry_date desc'
			end
	end


	def add
		@report = Report.new
		if request.post? then
			@report = Report.new(report_params)
			if @report.valid?
				@report = Report.create(report_params)
				redirect_to '/report/'
			else
				render :action => 'add'
			end
		end
	end


	def edit
		@report = Report.find(params[:id])
		if  request.patch? then
			@report.update(report_params)
			redirect_to '/report'
		end
	end
	
	def find
		page_size = 10
		@page_num = 0
		if params[:page] != nil then
			@page_num = params[:page].to_i - 1
		end
		@data = Report.all.order('created_at desc')
			.offset(page_size * @page_num)
			.limit(page_size)
			@allpage = Report.page(params[:page]).per(PER)
			@data = Array.new
			if request.post? then
				@data = Report.where "id like ?" , '%' + params[:find] + '%'
			end
	end
	
	def show
		
		@report = Report.find(params[:id])
		@data = Report.where(user_id: @report.user_id).order 'entry_date desc'
		
	end
	
	def detail
		@report = Report.find(params[:id])
	end
		
	def delete
		@report = Report.find(params[:id])
		if request.post? then
			@report.destroy
			redirect_to '/report'
		end
	end


	private
	def report_params
		params.require(:report).permit(:entry_date, :user_id, :report, :division_id)
	end

end