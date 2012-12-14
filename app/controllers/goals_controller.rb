class GoalsController < ApplicationController
	include GoalsHelper
	before_filter :load

	def load
		@all_goals = Goal.all

		@daily_goals = @all_goals.select{|g| g.daily==true}
		@todays_goals = @all_goals.select{|g| g.daily==false}
		@all_completed_goals = @all_goals.select{|g| g.complete==true}
		
		@completed_daily_goals = @daily_goals.select{|g| g.complete==true}
		@completed_todays_goals = @todays_goals.select{|g| g.complete==true}
	end

	def index
		@goal = Goal.new
		@selected_date = DateTime.now
	end

	def new
	end

	def create
		@goal = Goal.new(params[:goal])
	
		if !params[:daily] 
			@goal.start_time = DateTime.now
		else
			@goal.start_time = DateTime.now
		end

		if @goal.save
			flash[:notice] = "Created Goal"

			load

			respond_to do |format|
				format.html { redirect_to @goal }
				format.js
		    end
		end
	end

	def edit
		@goal = Goal.find(params[:id])
	end

	def update	
		@goal = Goal.find(params[:id])

		if @goal.update_attributes(params[:goal])
			flash[:notice] = "Successfully updated goal."
			load
		end
	end

	def toggle_complete
		@goal = Goal.find(params[:id])
		@goal.toggle!(:complete)
	end


	def destroy
		@goal = Goal.find(params[:id])
		@goal.destroy
		load
		flash[:notice] = "Successfully destroyed goal."
	end

end
