class CreateWorkpositions < ActiveRecord::Migration
  def self.up
    create_table :workpositions do |t|
      t.integer :user_id
      t.integer :organization_id
      t.string :title
      t.date :start_date
      t.date :end_date
      t.text :description
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :workpositions
  end
end