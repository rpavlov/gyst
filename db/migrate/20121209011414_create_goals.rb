class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :content
      t.boolean :daily, :default => false
      t.boolean :complete, :default => false
      t.datetime :start_time
      
      t.timestamps
    end
  end
end
