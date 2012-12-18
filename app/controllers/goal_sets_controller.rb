class GoalSetsController < ApplicationController
	include GoalsHelper
	before_filter :load, :only => [:index]

	def load
		@goalsets = GoalSet.all
		@all_goals = Goal.all
		@total_goal_count = @all_goals.count
		@completed_goal_count = Goal.complete.count
		#@daily_goalset = GoalSet.find_or_create_by_daily_and_start_time(true,DateTime.now.beginning_of_day);
		#@todays_goalset =  GoalSet.find_or_create_by_daily_and_start_time(false,DateTime.now.beginning_of_day);
		#@selected_goalset = @daily_goalset
		#@daily_goals = @daily_goalset.goals.where(:daily=>true)
		#@todays_goals = @daily_goalset.goals.where(:daily=>false)
		
		#@daily_goalset = GoalSet.daily.limit(1).first
		#@dated_goalsets =  GoalSet.dated
	end

	def index
		@goalset = GoalSet.new
	end

	def show
	end

	def new
		@goalset = GoalSet.new
	end

	def edit
		@goalset = GoalSet.find(params[:id])
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


end
