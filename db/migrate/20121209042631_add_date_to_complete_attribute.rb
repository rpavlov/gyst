class AddDateToCompleteAttribute < ActiveRecord::Migration
	def change
		add_column :goals, :date_to_complete, :datetime	
	end
end
