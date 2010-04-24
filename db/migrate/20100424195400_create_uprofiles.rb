class CreateUprofiles < ActiveRecord::Migration
  def self.up
    create_table :uprofiles do |t|
      t.integer :user_id
      t.string :summary
      t.string :specialities
      t.string :honorsawards
      t.string :linkedinurl
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :uprofiles
  end
end