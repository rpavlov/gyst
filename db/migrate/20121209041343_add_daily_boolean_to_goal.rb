class AddDailyBooleanToGoal < ActiveRecord::Migration
  def change
  		add_column :goals, :daily, :boolean, :default => false
  end
end
