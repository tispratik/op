class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      t.integer :user_id
      t.integer :organization_id
      t.string :degree
      t.string :field
      t.string :education_type
      t.string :start_date
      t.string :end_date
      t.text :description
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :educations
  end
end