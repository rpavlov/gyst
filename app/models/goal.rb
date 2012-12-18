class Goal < ActiveRecord::Base
	attr_accessible :complete, :content
	belongs_to :goal_set
	default_scope :order=> 'created_at'
	scope :complete, where(:complete => true)
end
