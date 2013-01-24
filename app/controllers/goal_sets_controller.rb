class GoalSetsController < ApplicationController
	include GoalsHelper
	before_filter :authenticate_user!, :load, :only => [:index]

	def load
		@goalsets = GoalSet.all
		@total_goal_count = Goal.count
		@completed_goal_count = Goal.complete.count
		@current_goalsets = GoalSet.all(:conditions=>["created_at >=:start_time", {:start_time=>Date.yesterday}])

		@goalset = GoalSet.new
	end

	def index
	end

	def edit
		@goalset = GoalSet.find(params[:id])
	end

	def destroy
		@goalset = GoalSet.find(params[:id])

		if @goalset.destroy
			flash[:notice] = "Successfully destroyed GoalSet."
			load	
		end
	end

	def create
		@goalset = GoalSet.new(params[:goalset])
		
		if @goalset.save
			flash[:notice] = "Successfully created GoalSet."
			load
		end
	end

	def update
		@goalset = GoalSet.find(params[:id])
		
		if @goalset.update_attributes params[:goalset] 
			flash[:notice] = "Successfully updated Goals"
			load
		end
	end

	def toggle_complete
		@goal = Goal.find(params[:id])
		@goal.toggle!(:complete)
		load
	end

	def destroy_goal
		@goal = Goal.find(params[:id])
		@goal.destroy
		load
	end

	def destroy_all_goalsets
		GoalSet.destroy_all
		load
	end

	def add_goal
		@goalset = GoalSet.find(params[:id])
		@goalset.goals.build
	end
end
