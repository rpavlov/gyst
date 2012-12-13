class GoalSet < ActiveRecord::Base
  attr_accessible :start_time, :daily
  has_many :goals

end
