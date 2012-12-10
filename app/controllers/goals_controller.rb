class GoalsController < ApplicationController

	def index
		@goal = Goal.new
		@daily_goals = Goal.where(:daily=>true)		
		@todays_goals = Goal.where(:date_to_complete => Date.today)
	end

	def new
		@goal = Goal.new
	end

	def create
		@goal = Goal.new(params[:goal])

		respond_to do |format|
		    if @goal.save
		      format.html  { redirect_to(@goal,
		                    :notice => 'New Goal was successfully created.') }
		      format.json  { render :json => @goal,
		                    :status => :created, :location => @goal }
		    else
		      format.html  { render :action => "new" }
		      format.json  { render :json => @goal.errors,
		                    :status => :unprocessable_entity }
		    end
		end
	end

	def show
		@goal = Goal.find(params[:id])

		respond_to do |format|
		    format.html  # show.html.erb
		    format.json  { render :json => @goal }
		end
	end

end
