class CreateUsrs < ActiveRecord::Migration
  def self.up
    create_table :usrs do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :one_line_bio
      t.date :dob
      t.timestamps
    end
  end
  
  def self.down
    drop_table :usrs
  end
end