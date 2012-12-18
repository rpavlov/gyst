class GoalSetsController < ApplicationController
	include GoalsHelper
	before_filter :load, :only => [:index, :create, :update, :toggle_complete]
	after_filter :load, :only => :destroy_goal

	def load
		@goalsets = GoalSet.all
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
		@goalsets = GoalSet.all
	end

	def show
		@goalset = GoalSet.find(params[:id])
	end

	def new
		@goalset = GoalSet.new
	end

	def edit
		@goalset = GoalSet.find(params[:id])
	end

	def create
		@goalset = GoalSet.new(params[:goalset])
		@goalset.start_time=DateTime.now
		if @goalset.save
			flash[:notice] = "Successfully created GoalSet."
		end
	end

	def toggle_complete
		@goal = Goal.find(params[:id])
		@goal.toggle!(:complete)
	end

	def destroy_goal
		@goal = Goal.find(params[:id])
		@goal.destroy
	end

	def update
		@goalset = GoalSet.find(params[:id])
		if @goalset.update_attributes params[:goalset] 
			flash[:notice] = "Successfully updated GoalSet."
		end
	end

end
