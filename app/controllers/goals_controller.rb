class GoalsController < ApplicationController

	before_filter :load

	def load
		@goal = Goal.new
		@daily_goals = Goal.where(:daily=>true)		
		#@todays_goals = Goal.where(:date_to_complete => Date.today)
		@todays_goals = Goal.where(:daily=>false)
	end

	def index
	end

	def new
		@goal = Goal.new
	end

	def create
		@goal = Goal.new(params[:goal])
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
		flash[:notice] = "Successfully destroyed goal."
	end

end
