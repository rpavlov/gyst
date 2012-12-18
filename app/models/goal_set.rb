class GoalSet < ActiveRecord::Base
  has_many :goals
  attr_accessible :start_time, :daily, :goals_attributes
  accepts_nested_attributes_for :goals, :allow_destroy => true
  
end
