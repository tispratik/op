class CreateUcontacts < ActiveRecord::Migration
  def self.up
    create_table :ucontacts do |t|
      t.string :email
      t.string :country_id
      t.string :state
      t.string :city
      t.string :street1
      t.string :street2
      t.string :zip
      t.string :is_address_public
      t.string :telnum1
      t.integer :telnum1_type
      t.boolean :is_telnum1_public
      t.string :telnum2
      t.integer :telnum2_type
      t.boolean :is_telnum2_public
      t.string :webpage1
      t.integer :webpage1_type
      t.string :webpage2
      t.integer :webpage2_type
      t.string :webpage3
      t.integer :webpage3_type
      t.string :time_zone
      t.string :short_description
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :ucontacts
  end
end