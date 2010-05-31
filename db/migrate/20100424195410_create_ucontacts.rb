class CreateUcontacts < ActiveRecord::Migration
  def self.up
    create_table :ucontacts do |t|
      t.integer :user_id
      t.integer :country_id
      t.string :state
      t.string :city
      t.string :street1
      t.string :street2
      t.string :zip
      t.string :is_address_public
      t.string :telnum1
      t.integer :telnum1_type
      t.boolean :is_contact_public
      t.integer :mobile
      t.references :carrier
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