class GoalSetsController < ApplicationController
	include GoalsHelper
	before_filter :authenticate_user!, :load, :only => [:index]

	def load
		@goalsets = GoalSet.all
		@all_goals = Goal.all
		@total_goal_count = @all_goals.count
		@completed_goal_count = Goal.complete.count
	end

	def index
		@goalset = GoalSet.new
	end

	def new
		@goalset = GoalSet.new
	end

	def edit
		@goalset = GoalSet.find(params[:id])
	end

	def destroy
		@goalset = GoalSet.find(params[:id])
		@goalset.destroy
		load
	end

	def create
		@goalset = GoalSet.new(params[:goalset])
		
		if @goalset.save
			flash[:notice] = "Successfully created GoalSet."
		else
			flash[:notice] = "A set of Goals already exist for this date!"
		end
		load
	end

	def update
		@goalset = GoalSet.find(params[:id])

		if @goalset.update_attributes params[:goalset] 
			flash[:notice] = "Successfully updated Goals"
		end
		
		#Ugly
		@goalset = GoalSet.new

		load
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

	def add_goal
		@goalset = GoalSet.find(params[:id])
		@goalset.goals.build
	end
end
