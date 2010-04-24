class CreateUsrs < ActiveRecord::Migration
  def self.up
    create_table :usrs do |t|
      t.integer :user_id
      t.first_name :string
      t.last_name :string
      t.one_line_bio :string
      t.date :dob
      t.boolean :is_dp_gravatar
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :usrs
  end
end