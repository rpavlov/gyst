class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :content
      t.boolean :complete, :default => false
      t.boolean :daily, :default => false
      t.datetime :start_time, :datetime	
      
      t.timestamps
    end
  end
end
