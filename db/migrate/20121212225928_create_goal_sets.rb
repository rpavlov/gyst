class CreateGoalSets < ActiveRecord::Migration
  def change
    create_table :goal_sets do |t|
      t.datetime :start_time
      t.boolean :daily, :default => false
      
      t.timestamps
    end
  end
end
