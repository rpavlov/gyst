class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :content
      t.boolean :complete, :default => false

      t.timestamps
    end
  end
end
