class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.integer :venue_type
      t.string :venue_name
      t.string :street_address
      t.string :city
      t.string :country
      t.integer :zip

      t.timestamps
    end
  end
end
