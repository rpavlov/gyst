class GoalSet < ActiveRecord::Base
  has_many :goals
  attr_accessible :start_time, :daily, :goals_attributes
  accepts_nested_attributes_for :goals, 
  	:allow_destroy => true, :reject_if => :all_blank
  validates :start_time, :uniqueness=>true

  def completed_goals
  	goals.complete.count
  end

  def start_time_readable
  	if start_time.to_date == Date.today
  		"Today"
  	else
  		start_time.strftime("%A")
  	end
  end

end
