class Goal < ActiveRecord::Base
	attr_accessible :complete, :content, :start_time, :daily
	belongs_to :goal_set
	default_scope :order=> 'created_at'
end
