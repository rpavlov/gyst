class GoalSetsController < ApplicationController
	include GoalsHelper
	before_filter :load

	def load
		@all_goal_sets = GoalSet.all
		#@daily_goal_set = Goal.where(:daily=>true)
	end

	def index

	end

	def new
		@new_goal_set = GoalSet.new
		@new_goal = Goal.new(params[:new_goal])
	end
end
