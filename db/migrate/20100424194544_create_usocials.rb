class CreateUsocials < ActiveRecord::Migration
  def self.up
    create_table :usocials do |t|
      t.integer :user_id
      t.string :application
      t.string :application_login
      t.string :atoken
      t.string :asecret
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :usocials
  end
end