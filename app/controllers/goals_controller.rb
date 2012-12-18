class GoalsController < ApplicationController
	include GoalsHelper

=begin
	def load

		@all_goals = Goal.all

		@daily_goals = @all_goals.select{|g| g.daily==true}
		@todays_goals = @all_goals.select{|g| g.daily==false}
		@all_completed_goals = @all_goals.select{|g| g.complete==true}
		
		@completed_daily_goals = @daily_goals.select{|g| g.complete==true}
		@completed_todays_goals = @todays_goals.select{|g| g.complete==true}
=end

	end

	def index
	end

	def new
	end

	def create
	end

	def edit
	end

	def update	
	end

	def destroy
	end

end
